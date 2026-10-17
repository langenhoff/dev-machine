$ErrorActionPreference = "Stop"

Write-Host "=== Installing applications ===" -ForegroundColor Green

$packages = @(
    "Git.Git"
	"IrfanSkiljan.IrfanView"
    "Microsoft.PowerShell"
	"Microsoft.WindowsTerminal"
	"Microsoft.Sysinternals.Suite"
	"7zip.7zip"
	"Notepad++.Notepad++"
	"VideoLAN.VLC"
	"WinMerge.WinMerge"
	"Python.Python.3.13"
)

foreach ($pkg in $packages) {
    if (-not (winget list --exact --id $pkg 2>$null | Select-String -simplematch $pkg)) {
        Write-Host "Installing $pkg"
        winget install `
            --exact `
            --id $pkg `
            --accept-package-agreements `
            --accept-source-agreements
    }
    else {
        Write-Host "$pkg already installed"
    }
}


Write-Host "=== Applications installed ===" -ForegroundColor Green
