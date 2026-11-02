# Clona el cliente MxSIG y le copia el overlay de los cuadernillos.
# No toca un geovisor que ya exista.

$ErrorActionPreference = "Stop"
$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$dest = Join-Path $root "geovisor"
$revision = "e0c22b375eb93e3e551c4a2e2a810fe4d7c99f4d"

if (Test-Path (Join-Path $dest ".git")) {
    Write-Host "Ya existe, no se toca: $dest"
} elseif (Test-Path $dest) {
    Write-Host "La carpeta existe y no es un clone. No se toca: $dest"
} else {
    Write-Host "Clonando mxsig_client"
    git clone https://git.inegi.org.mx/mxsig/mxsig_client.git $dest
    if ($LASTEXITCODE -ne 0) {
        throw "git clone fallo"
    }
    git -C $dest checkout $revision
    if ($LASTEXITCODE -ne 0) {
        throw "git checkout fallo"
    }
    & (Join-Path $PSScriptRoot "aplicar-overlay-geovisor.ps1")
}

Write-Host "Listo."
