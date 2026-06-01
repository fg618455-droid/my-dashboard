# migrate.ps1 — Supabase Schema-Migration fuer das Dashboard
# Fuehre dieses Script einmal aus um alle fehlenden Tabellen anzulegen.
# Voraussetzung: supabase CLI muss eingeloggt sein (supabase login)

$PROJECT_REF = "rdkqtegwkzfdvjphfjfw"
$SCHEMA_FILE = Join-Path $PSScriptRoot "schema_fixed.sql"

Write-Host "`n== Dashboard DB Migration ==" -ForegroundColor Cyan

# Check npx
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
    Write-Host "FEHLER: Node.js / npx nicht gefunden. Installiere Node.js von https://nodejs.org" -ForegroundColor Red
    exit 1
}

# Check login
$loginCheck = npx supabase projects list 2>&1
if ($loginCheck -match "Access token not provided") {
    Write-Host "`nNicht eingeloggt. Oeffne Browser fuer Supabase Login..." -ForegroundColor Yellow
    npx supabase login
    if ($LASTEXITCODE -ne 0) { exit 1 }
}

# Link project if not already
Write-Host "`nVerknuepfe Projekt $PROJECT_REF..." -ForegroundColor Cyan
npx supabase link --project-ref $PROJECT_REF 2>&1 | Out-Null

# Read SQL
$sql = Get-Content $SCHEMA_FILE -Raw

# Execute via Management API
$token = (npx supabase --output json projects list 2>&1 | ConvertFrom-Json | Where-Object { $_.id -eq $PROJECT_REF })
if (-not $token) {
    # Fallback: try db push approach
    Write-Host "`nVersuch: db query..." -ForegroundColor Yellow
    $tmpSql = [System.IO.Path]::GetTempFileName() + ".sql"
    Set-Content -Path $tmpSql -Value $sql -Encoding utf8
    npx supabase db execute --file $tmpSql 2>&1
    Remove-Item $tmpSql -ErrorAction SilentlyContinue
} else {
    Write-Host "`nFuehre Schema aus..." -ForegroundColor Cyan
    npx supabase db execute --project-ref $PROJECT_REF --file $SCHEMA_FILE
}

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n[OK] Alle Tabellen angelegt!" -ForegroundColor Green
    Write-Host "Tabellen: habits, habit_logs, daily_reflections, health_logs, grades, exams, homework" -ForegroundColor Green
} else {
    Write-Host "`n[FALLBACK] Oeffne Supabase SQL Editor:" -ForegroundColor Yellow
    Write-Host "  https://app.supabase.com/project/$PROJECT_REF/sql/new" -ForegroundColor White
    Write-Host "  Kopiere den Inhalt von schema_fixed.sql und fuehre ihn dort aus." -ForegroundColor White
    Start-Process "https://app.supabase.com/project/$PROJECT_REF/sql/new"
}
