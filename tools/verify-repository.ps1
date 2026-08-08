param(
    [switch]$SkipGitCleanCheck,
    [switch]$SkipManualReview
)

$ErrorActionPreference = 'Stop'

$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

function Get-PngInfo {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $Bytes = [System.IO.File]::ReadAllBytes($Path)

    if ($Bytes.Length -lt 24) {
        throw "PNG file is too small: $Path"
    }

    $ExpectedSignature = [byte[]](
        0x89, 0x50, 0x4E, 0x47,
        0x0D, 0x0A, 0x1A, 0x0A
    )

    for ($Index = 0; $Index -lt 8; $Index++) {
        if ($Bytes[$Index] -ne $ExpectedSignature[$Index]) {
            throw "File is not encoded as PNG: $Path"
        }
    }

    $Width = (
        ([int64]$Bytes[16] -shl 24) -bor
        ([int64]$Bytes[17] -shl 16) -bor
        ([int64]$Bytes[18] -shl 8) -bor
        [int64]$Bytes[19]
    )

    $Height = (
        ([int64]$Bytes[20] -shl 24) -bor
        ([int64]$Bytes[21] -shl 16) -bor
        ([int64]$Bytes[22] -shl 8) -bor
        [int64]$Bytes[23]
    )

    return [pscustomobject]@{
        Width = $Width
        Height = $Height
    }
}

function Get-PbixInfo {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "PBIX file was not found: $Path"
    }

    $File = Get-Item -LiteralPath $Path -Force

    # PBIX validity is determined by package signature and ZIP structure, not an arbitrary byte threshold.

    $Bytes = [System.IO.File]::ReadAllBytes($Path)

    if (
        $Bytes.Length -lt 4 -or
        $Bytes[0] -ne 0x50 -or
        $Bytes[1] -ne 0x4B
    ) {
        throw "PBIX file does not have a ZIP package signature: $Path"
    }

    Add-Type -AssemblyName System.IO.Compression.FileSystem

    $Archive = $null

    try {
        $Archive = [System.IO.Compression.ZipFile]::OpenRead($Path)

        if ($Archive.Entries.Count -lt 3) {
            throw "PBIX package contains too few entries: $Path"
        }

        $EntryNames = @(
            $Archive.Entries |
            ForEach-Object {
                $_.FullName
            }
        )

        return [pscustomobject]@{
            Length = $File.Length
            EntryCount = $Archive.Entries.Count
            EntryNames = $EntryNames
            Sha256 = (
                Get-FileHash `
                    -LiteralPath $Path `
                    -Algorithm SHA256
            ).Hash
        }
    }
    catch {
        throw "PBIX package could not be opened: $Path`r`n$($_.Exception.Message)"
    }
    finally {
        if ($Archive) {
            $Archive.Dispose()
        }
    }
}

if (
    -not $SkipGitCleanCheck -and
    (Test-Path '.git' -PathType Container) -and
    (git status --porcelain)
) {
    throw 'Working tree must be clean before release verification.'
}

$PbixFiles = @(
    'power-bi/OperationsFlow_Dashboard_v1.pbix'
    'power-bi/OperationsFlow_Dashboard_v1_1.pbix'
    'power-bi/OperationsFlow_Dashboard_v1_2.pbix'
    'power-bi/OperationsFlow_Dashboard_v1_3.pbix'
)

$CsvFiles = @(
    'sample-data/Safety_Incidents.csv'
    'sample-data/Corrective_Actions.csv'
    'sample-data/Training_Expiry.csv'
    'sample-data/Document_Control.csv'
    'sample-data/Work_Orders.csv'
    'sample-data/Risk_Register.csv'
)

$SourceScreenshots = [ordered]@{
    'screenshots/OperationsFlow_SafetyFlow_ExecutiveOverview_v1.png' = 'docs/screenshot-groups/screenshot-group-01-toolkit-closure/01-executive-overview.png'
    'screenshots/OperationsFlow_SafetyFlow_CorrectiveActions_v1.png' = 'docs/screenshot-groups/screenshot-group-01-toolkit-closure/02-corrective-actions.png'
    'screenshots/OperationsFlow_SafetyFlow_TrainingCompliance_v1.png' = 'docs/screenshot-groups/screenshot-group-01-toolkit-closure/03-training-compliance.png'
    'screenshots/OperationsFlow_DocumentControl_v1.png' = 'docs/screenshot-groups/screenshot-group-01-toolkit-closure/04-document-control.png'
    'screenshots/OperationsFlow_WorkOrders_v1.png' = 'docs/screenshot-groups/screenshot-group-01-toolkit-closure/05-work-orders.png'
    'screenshots/OperationsFlow_RiskRegister_v1.png' = 'docs/screenshot-groups/screenshot-group-01-toolkit-closure/06-risk-register.png'
}

$RequiredDocs = @(
    'README.md'
    'SECURITY.md'
    'RIGHTS_AND_LICENSING.md'
    'CHANGELOG.md'
    'docs/MASTER.md'
    'docs/CURRENT_BUCKET.md'
    'docs/REPRODUCTION.md'
    'docs/project-state.json'
    'docs/release-notes/v1.3.0.md'
    'docs/screenshot-groups/screenshot-group-01-toolkit-closure/README.md'
)

foreach ($RelativePath in @($PbixFiles + $CsvFiles + $RequiredDocs)) {
    if (-not (Test-Path -LiteralPath (Join-Path $Root $RelativePath) -PathType Leaf)) {
        throw "Required file is missing: $RelativePath"
    }
}

$PbixInfo = [ordered]@{}

foreach ($RelativePath in $PbixFiles) {
    $PbixInfo[$RelativePath] = Get-PbixInfo -Path (Join-Path $Root $RelativePath)
}

$CsvSummary = [ordered]@{}

foreach ($RelativePath in $CsvFiles) {
    $Rows = @(Import-Csv -LiteralPath (Join-Path $Root $RelativePath))

    if ($Rows.Count -lt 1) {
        throw "$RelativePath contains no data rows."
    }

    $Headers = @($Rows[0].PSObject.Properties.Name)

    if ($Headers.Count -lt 5) {
        throw "$RelativePath contains too few columns."
    }

    if (($Headers | Sort-Object -Unique).Count -ne $Headers.Count) {
        throw "$RelativePath contains duplicate column names."
    }

    $CsvSummary[$RelativePath] = [pscustomobject]@{
        Rows = $Rows.Count
        Columns = $Headers.Count
        Sha256 = (
            Get-FileHash `
                -LiteralPath (Join-Path $Root $RelativePath) `
                -Algorithm SHA256
        ).Hash
    }
}

$ScreenshotHashes = @{}

foreach ($SourceRelative in $SourceScreenshots.Keys) {
    $EvidenceRelative = [string]$SourceScreenshots[$SourceRelative]
    $SourcePath = Join-Path $Root $SourceRelative
    $EvidencePath = Join-Path $Root $EvidenceRelative

    foreach ($Path in @($SourcePath, $EvidencePath)) {
        if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
            throw "Screenshot is missing: $Path"
        }

        $Info = Get-PngInfo -Path $Path

        if ($Info.Width -lt 1000 -or $Info.Height -lt 500) {
            throw "Screenshot is smaller than the approved review size: $Path"
        }

        if ($Info.Width -le $Info.Height) {
            throw "Screenshot is not landscape: $Path"
        }
    }

    $SourceHash = (Get-FileHash -LiteralPath $SourcePath -Algorithm SHA256).Hash
    $EvidenceHash = (Get-FileHash -LiteralPath $EvidencePath -Algorithm SHA256).Hash

    if ($SourceHash -ne $EvidenceHash) {
        throw "Formal evidence does not match source screenshot: $EvidenceRelative"
    }

    if ($ScreenshotHashes.ContainsKey($EvidenceHash)) {
        throw (
            "Duplicate evidence screenshots detected: " +
            "$($ScreenshotHashes[$EvidenceHash]) and $EvidenceRelative"
        )
    }

    $ScreenshotHashes[$EvidenceHash] = $EvidenceRelative
}

$ReviewPath = Join-Path `
    $Root `
    'docs/manual-validation/v1.3.0-powerbi-review.json'

if (-not $SkipManualReview) {
    if (-not (Test-Path -LiteralPath $ReviewPath -PathType Leaf)) {
        throw 'Manual Power BI review record is missing.'
    }

    $Review = Get-Content -LiteralPath $ReviewPath -Raw | ConvertFrom-Json

    if ($Review.approved -ne $true) {
        throw 'Manual Power BI review is not approved.'
    }

    $LatestRelative = 'power-bi/OperationsFlow_Dashboard_v1_3.pbix'
    $LatestHash = [string]$PbixInfo[$LatestRelative].Sha256

    if ([string]$Review.latestPbixSha256 -ne $LatestHash) {
        throw 'Manual review hash does not match the current v1.3 PBIX.'
    }

    foreach ($RelativePath in $CsvFiles) {
        $Property = $Review.csvSha256.PSObject.Properties[$RelativePath]

        if (-not $Property) {
            throw "Manual review is missing a CSV hash: $RelativePath"
        }

        if ([string]$Property.Value -ne [string]$CsvSummary[$RelativePath].Sha256) {
            throw "Manual review CSV hash does not match: $RelativePath"
        }
    }
}

$TrackedFiles = @()

if (Test-Path '.git' -PathType Container) {
    $TrackedFiles = @(
        git -c core.quotepath=false ls-files
    )

    foreach ($TrackedFile in $TrackedFiles) {
        $Normalised = $TrackedFile.Replace('\', '/')

        if (
            $Normalised -eq '.env' -or
            $Normalised.StartsWith('artifacts/') -or
            $Normalised.StartsWith('.sg1-backup-')
        ) {
            throw "Generated or private path is tracked: $TrackedFile"
        }
    }
}

$TextExtensions = @(
    '.md', '.csv', '.json', '.yml', '.yaml', '.txt', '.gitignore'
)

$TextFiles = @(
    foreach ($TrackedFile in $TrackedFiles) {
        $Normalised = $TrackedFile.Replace('\', '/')

        if ($Normalised -eq 'tools/verify-repository.ps1') {
            continue
        }

        $FullPath = Join-Path $Root $TrackedFile

        if (-not (Test-Path -LiteralPath $FullPath -PathType Leaf)) {
            continue
        }

        $Extension = [System.IO.Path]::GetExtension($FullPath).ToLowerInvariant()

        if (
            $Extension -in $TextExtensions -or
            $Normalised -eq '.gitignore'
        ) {
            Get-Item -LiteralPath $FullPath -Force
        }
    }
)

$Patterns = @(
    '(?i)[A-Za-z]:[/\\]Users[/\\][^/\\]+[/\\]'
    '(?i)/Users/[^/]+/'
    '(?i)/home/[^/]+/'
    '(?i)password\s*[:=]\s*[^\s#]+'
    '(?i)client[_-]?secret\s*[:=]\s*[^\s#]+'
    '(?i)-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----'
)

$Findings = @()

foreach ($Pattern in $Patterns) {
    $Findings += @(
        $TextFiles |
        Select-String -Pattern $Pattern -ErrorAction SilentlyContinue
    )
}

if ($Findings.Count -gt 0) {
    $Summary = $Findings |
        ForEach-Object {
            "$($_.Path):$($_.LineNumber)"
        }

    throw (
        "Machine-specific paths or secret-shaped values were found:`r`n" +
        ($Summary -join "`r`n")
    )
}

$Readme = Get-Content -LiteralPath (Join-Path $Root 'README.md') -Raw

if ($Readme -notmatch '(?i)designed but not deployed') {
    throw 'README does not preserve the Microsoft 365 deployment boundary.'
}

$ReportRoot = Join-Path $Root 'artifacts/validation'
New-Item -ItemType Directory -Force -Path $ReportRoot | Out-Null

$Report = @(
    'OperationsFlow Toolkit repository verification passed.'
    "PBIX files:       $($PbixFiles.Count)"
    "CSV datasets:     $($CsvFiles.Count)"
    "Screenshots:      $($SourceScreenshots.Count)"
    "Latest PBIX hash: $([string]$PbixInfo['power-bi/OperationsFlow_Dashboard_v1_3.pbix'].Sha256)"
    "Manual review:    $(-not $SkipManualReview)"
    'Microsoft 365:    designed-not-deployed'
)

[System.IO.File]::WriteAllLines(
    (Join-Path $ReportRoot 'repository-verification.txt'),
    $Report,
    (New-Object System.Text.UTF8Encoding($false))
)

$Report | ForEach-Object { Write-Host $_ }
