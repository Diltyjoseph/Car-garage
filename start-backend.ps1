# GaragePro - Start Backend Script
# Run this file from: c:\Users\Dilty\Desktop\car-garage\backend
# Double-click or right-click > "Run with PowerShell"

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  GaragePro Backend Startup Script  " -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# ─── Set environment variables ───────────────────────────────────────────────
$env:SERPAPI_KEY  = "a76beda96496631e8f6b08840c3f8583cfb2042fb777f9813365d7393320d8c5"
$env:DB_URL       = "jdbc:mysql://localhost:3306/garagepro?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true"
$env:DB_USERNAME  = "root"
$env:DB_PASSWORD  = "root"   # <-- CHANGE THIS if your MySQL password is different
$env:JWT_SECRET   = "garagepro_super_secret_jwt_key_2026_hackathon"

# ─── Check MySQL is running ───────────────────────────────────────────────────
Write-Host "[1/3] Checking MySQL..." -ForegroundColor Yellow
$mysqlRunning = $false
try {
    $conn = New-Object System.Net.Sockets.TcpClient("localhost", 3306)
    $conn.Close()
    $mysqlRunning = $true
} catch {}

if (-not $mysqlRunning) {
    Write-Host "      MySQL not detected on port 3306." -ForegroundColor Red
    Write-Host ""
    Write-Host "  Please start MySQL first:" -ForegroundColor Yellow
    Write-Host "  Option A:  net start MySQL80" -ForegroundColor White
    Write-Host "  Option B:  Open MySQL Workbench and start the server" -ForegroundColor White
    Write-Host "  Option C:  Open XAMPP/WAMP and start MySQL" -ForegroundColor White
    Write-Host ""
    Write-Host "  Then run this script again." -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "      MySQL is running on port 3306. " -ForegroundColor Green

# ─── Check JAR exists ────────────────────────────────────────────────────────
Write-Host "[2/3] Checking backend JAR..." -ForegroundColor Yellow
$JAR = "target\garagepro-backend-0.0.1-SNAPSHOT.jar"
if (-not (Test-Path $JAR)) {
    Write-Host "      JAR not found. Building now..." -ForegroundColor Yellow
    $env:PATH += ";C:\Users\Dilty\maven\apache-maven-3.9.16\bin"
    mvn package -DskipTests -q
    if ($LASTEXITCODE -ne 0) {
        Write-Host "      BUILD FAILED! Check errors above." -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}
Write-Host "      JAR found. " -ForegroundColor Green

# ─── Start backend ───────────────────────────────────────────────────────────
Write-Host "[3/3] Starting GaragePro backend on port 8080..." -ForegroundColor Yellow
Write-Host ""
Write-Host "  Login:  admin@garagepro.com / admin123" -ForegroundColor Cyan
Write-Host "  URL:    http://localhost:8080" -ForegroundColor Cyan
Write-Host "  Press Ctrl+C to stop." -ForegroundColor Gray
Write-Host ""

java `
  "-DSERPAPI_KEY=$env:SERPAPI_KEY" `
  "-DDB_URL=$env:DB_URL" `
  "-DDB_USERNAME=$env:DB_USERNAME" `
  "-DDB_PASSWORD=$env:DB_PASSWORD" `
  "-DJWT_SECRET=$env:JWT_SECRET" `
  -jar $JAR
