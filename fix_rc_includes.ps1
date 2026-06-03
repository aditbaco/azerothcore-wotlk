# Durable fix for Windows "RC command-line too long" (MSB6002/MSB6003).
# AzerothCore feeds ALL ~387+ target include dirs to rc.exe for worldserver.rc,
# which exceeds Windows' 32000-char limit once modules pile up. The .rc only
# needs its own dir (resource.h) + the build dir (revision.h).
# RUN THIS AFTER EVERY `cmake ... (configure)` AND BEFORE BUILDING worldserver.
#   pwsh -File fix_rc_includes.ps1
# It rewrites ONLY the ResourceCompile include list (ClCompile untouched, so
# compiled .obj files stay valid).
param(
  [string]$Tree  = "D:\LARAGON\www\azerothcore-playerbots",
  [string]$Build = "D:\LARAGON\www\azerothcore-playerbots\build"
)
$vcx = Join-Path $Build "src\server\apps\worldserver.vcxproj"
if (-not (Test-Path $vcx)) { Write-Error "worldserver.vcxproj not found at $vcx (configure first)"; exit 1 }
$min = (Join-Path $Tree "src\server\apps\worldserver") + ";" + $Build
$c = Get-Content $vcx -Raw
$new = [regex]::Replace($c, '(?s)(<ResourceCompile>.*?<AdditionalIncludeDirectories>).*?(</AdditionalIncludeDirectories>)', ('${1}' + $min + '${2}'))
Set-Content -Path $vcx -Value $new -NoNewline -Encoding UTF8
$n = ([regex]::Matches($new, '(?s)<ResourceCompile>.*?<AdditionalIncludeDirectories>(.*?)</AdditionalIncludeDirectories>')).Count
Write-Output "Patched $n ResourceCompile block(s) -> minimal includes: $min"
