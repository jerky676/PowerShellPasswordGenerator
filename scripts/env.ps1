# $ErrorActionPreference = 'Stop'
$parent="$((get-item $PSScriptRoot).parent.FullName)"
$tests="$parent\tests"
$src="$parent\src"
$srcPublic="$src\public"
$srcPrivate="$src\private"
$scripts="$parent\scripts"
$moduleName="PSStartUp"
$outdir="$parent\out"
$testpublish="$outdir\test"
$publish="$outdir\$moduleName"
$manifestFileName="$moduleName.psd1"
$module="$publish\PSStartUp.psm1"

$guid="4fac93cf-b3c7-4511-be9e-a3dae70adb93"
$author="Justin Luther"
$companyname="Datafounder"
$description="This is a PowerShell Module to generate strong passwords."
$psVersion = "6.0"
$tags=@("Security","Generator","Password","Generator")
$gitHubBaseUri="https://github.com/jerky676/PowerShellPasswordGenerator"
$licenseUri = "$gitHubBaseUri/blob/master/LICENSE.md"
$projectUri = "$gitHubBaseUri/PowerShellStartUp"
$helpInfoUri = "$gitHubBaseUri/PowerShellStartUp/wiki"


. "$scripts\functions.ps1"