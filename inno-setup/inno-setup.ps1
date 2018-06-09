param(
    [string]$ScriptFile,
    [string]$Arguments
)

foreach($key in $PSBoundParameters.Keys)
{
    Write-Host ("[Debug]" + $key + ' : ' + $PSBoundParameters[$key])
}

Write-Host ("[Debug] BUILD_BINARIESDIRECTORY : " + $Env:BUILD_BINARIESDIRECTORY)

$WorkingDir = Split-Path $MyInvocation.MyCommand.Path
Write-Host ("[Debug] WorkingDir : " + $WorkingDir)

$ISCC = Join-Path $WorkingDir "ISCC.exe"
Write-Host ("[Debug] ISCC : " + $ISCC)

$Arguments = $Arguments + '
 "' + $ScriptFile + '"'
Write-Host ("[Debug] Arguments: " + $Arguments)

Invoke-Tool -Path $ISCC -Arguments $Arguments
