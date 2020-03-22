/ Citrix StoreFront customisation guide 
Invoke-Expression ".\pixie.exe"

Choice.exe /C YN /M "Do you want StoreFront to display the servername? [Y/N]"
if errorlevel 2 goto :No

$SFVersion = Read-Host -Prompt 
$colour = "FFFFFF"
Invoke-Expression ".\pixie.exe"
$Server = Read-Host -Prompt 'Input your server  name'
/ Invoke-Expression ".\pixie.exe"


(Get-Content style.css) | 
Foreach-Object {$_ -replace '#test',"$colour"}  | 
Out-File style.css



:No
