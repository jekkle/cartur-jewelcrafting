# Builds Jewelcrafting and zips a Thunderstore-ready package into dist/, plus a Nexus zip.
#
#   powershell -ExecutionPolicy Bypass -File tools\pack.ps1
#
# The build is the SDK project (Jewelcrafting\CarturJewelcrafting.csproj); what ships is the merged
# DLL ILRepack.targets writes to bin\Release\net481\merged - the helper libraries and YamlDotNet are
# inside it. It deploys to the CleanTest profile: Jewelcrafting refuses to load beside Epic Loot,
# which the Default profile runs.

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$pkg = Join-Path $root "package"
$dist = Join-Path $root "dist"

$manifest = Get-Content (Join-Path $pkg "manifest.json") -Raw | ConvertFrom-Json
$version = $manifest.version_number

# The plugin version and the package version must agree, or the listing lies about the DLL.
$plugin = Get-Content (Join-Path $root "Jewelcrafting\Jewelcrafting.cs") -Raw
if ($plugin -notmatch 'ModVersion\s*=\s*"([^"]+)"') { throw "Could not read ModVersion from Jewelcrafting.cs" }
if ($Matches[1] -ne $version) { throw "manifest.json is $version but the plugin says $($Matches[1])" }

python (Join-Path $PSScriptRoot "footer.py")
if ($LASTEXITCODE -ne 0) { throw "footer.py failed - not packing a README without its links" }

$profile = "$env:APPDATA\r2modmanPlus-local\Valheim\profiles\CleanTest"
dotnet build (Join-Path $root "Jewelcrafting\CarturJewelcrafting.csproj") -c Release "-p:R2MODMAN_PROFILE=$profile"
if (-not $?) { throw "build failed" }
$dll = Join-Path $root "Jewelcrafting\bin\Release\net481\merged\Jewelcrafting.dll"

$plugins = Join-Path $pkg "plugins"
if (Test-Path $plugins) { Remove-Item $plugins -Recurse -Force }
New-Item -ItemType Directory -Force -Path $plugins | Out-Null
Copy-Item $dll $plugins -Force

New-Item -ItemType Directory -Force -Path $dist | Out-Null
$zip = Join-Path $dist "Carturs_Jewelcrafting-$version.zip"
if (Test-Path $zip) { Remove-Item $zip }

# Entry by entry with forward slashes - Compress-Archive writes backslashes, which installers
# turn into a file literally named "plugins\Jewelcrafting.dll".
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [System.IO.Compression.ZipFile]::Open($zip, "Create")
try {
    foreach ($file in Get-ChildItem $pkg -Recurse -File) {
        $name = $file.FullName.Substring($pkg.Length + 1).Replace("\", "/")
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $file.FullName, $name) | Out-Null
    }
}
finally { $archive.Dispose() }
Write-Host "packed $zip"

# Nexus unpacks into the game folder: the DLL at its real path and nothing else.
$nexus = Join-Path $dist "Carturs_Jewelcrafting-$version-Nexus.zip"
if (Test-Path $nexus) { Remove-Item $nexus }
$archive = [System.IO.Compression.ZipFile]::Open($nexus, "Create")
try {
    [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
        $archive, (Join-Path $plugins "Jewelcrafting.dll"), "BepInEx/plugins/CarturJewelcrafting/Jewelcrafting.dll") | Out-Null
}
finally { $archive.Dispose() }
Write-Host "packed $nexus"
