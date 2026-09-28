# GaragePro - Start Frontend Script
# Run this file from: c:\Users\Dilty\Desktop\car-garage
# Double-click or right-click > "Run with PowerShell"

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  GaragePro Frontend Dev Server     " -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting frontend on http://localhost:5173 ..." -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop." -ForegroundColor Gray
Write-Host ""

Set-Location "$PSScriptRoot\frontend"
npm run dev
