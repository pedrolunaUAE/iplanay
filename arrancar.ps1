# Levanta el visor usando el .env de la plataforma si este repo vive dentro de ella.

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$dePlataforma = Join-Path $PSScriptRoot "..\..\.env"
$local = Join-Path $PSScriptRoot ".env"
if (Test-Path $dePlataforma) {
    $envFile = (Resolve-Path $dePlataforma).Path
} elseif (Test-Path $local) {
    $envFile = (Resolve-Path $local).Path
} else {
    throw "No hay .env. Usa el de la plataforma o copia .env.example a .env."
}

docker compose --env-file $envFile up -d --build
if ($LASTEXITCODE -ne 0) {
    throw "docker compose fallo"
}
