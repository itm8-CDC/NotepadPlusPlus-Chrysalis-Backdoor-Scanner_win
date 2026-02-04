
$dir = "'$PSScriptRoot'"
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  # Relaunch as an elevated process:
  Start-Process powershell.exe " -Command",('"set-location {0};Write-host "Running... This window will close when done"; & ".\files\velociraptor-v0.75.6-windows-386.exe" "artifacts --definitions=.\artifacts collect Windows.Detection.LotusBlossom.Chrysalis --output=.\chrysalis_SEE_YOUR_RESULTS_HERE.zip --format=csv --cpu_limit=5"; exit"' -f $dir) -Verb RunAs
  exit
}
