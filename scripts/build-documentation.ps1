# PowerShell Build Script for Professional Documentation
# File: scripts/build-documentation.ps1

Write-Host "=== Professional Documentation Build Script ===" -ForegroundColor Green
Write-Host "Starting documentation generation process..." -ForegroundColor Yellow

# Define input files in correct order
$inputFiles = @(
    "docs/metadata.yaml",
    "docs/01-introduction.md",
    "docs/02-pandoc-fundamentals.md",
    "docs/03-markdown-best-practices.md",
    "docs/04-template-configuration.md",
    "docs/05-automation-workflow.md",
    "docs/06-bibliography.md"
)

# Generate timestamp for output file
$timestamp = Get-Date -Format "yyyyMMdd-HHmm"
$outputFile = "output/$timestamp-GUIDE-PROF-DOK-KOMA-SCRIPT.pdf"

Write-Host "Input files:" -ForegroundColor Cyan
foreach ($file in $inputFiles) {
    if (Test-Path $file) {
        Write-Host "  ✓ $file" -ForegroundColor Green
    }
    else {
        Write-Host "  ✗ $file (MISSING!)" -ForegroundColor Red
        exit 1
    }
}

Write-Host "`nUsing KOMA-Script (no custom template needed)..." -ForegroundColor Cyan
Write-Host "  ✓ KOMA-Script will use Pandoc's default LaTeX template" -ForegroundColor Green

Write-Host "`nCreating output directory..." -ForegroundColor Cyan
if (!(Test-Path "output")) {
    New-Item -ItemType Directory -Path "output" | Out-Null
    Write-Host "  ✓ Output directory created" -ForegroundColor Green
}
else {
    Write-Host "  ✓ Output directory exists" -ForegroundColor Green
}

Write-Host "`nGenerating PDF with Pandoc..." -ForegroundColor Cyan
Write-Host "Output file: $outputFile" -ForegroundColor Yellow

try {
    # Execute Pandoc command for KOMA-Script
    pandoc $inputFiles `
        --pdf-engine=xelatex `
        --toc `
        --toc-depth=3 `
        --number-sections `
        --citeproc `
        -o $outputFile
    
    if (Test-Path $outputFile) {
        $fileSize = (Get-Item $outputFile).Length
        $fileSizeKB = [math]::Round($fileSize / 1024, 2)
        
        Write-Host "`n=== BUILD SUCCESSFUL ===" -ForegroundColor Green
        Write-Host "PDF generated: $outputFile" -ForegroundColor Green
        Write-Host "File size: $fileSizeKB KB" -ForegroundColor Green
        Write-Host "`nOpening PDF..." -ForegroundColor Yellow
        
        # Open the PDF file
        Start-Process $outputFile
        
    }
    else {
        Write-Host "`n=== BUILD FAILED ===" -ForegroundColor Red
        Write-Host "PDF file was not generated!" -ForegroundColor Red
        exit 1
    }
    
}
catch {
    Write-Host "`n=== BUILD ERROR ===" -ForegroundColor Red
    Write-Host "Error occurred during PDF generation:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}

Write-Host "`n=== DOCUMENTATION BUILD COMPLETE ===" -ForegroundColor Green