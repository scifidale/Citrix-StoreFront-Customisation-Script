/ Citrix StoreFront customisation guide 
Invoke-Expression ".\pixie.exe"

Choice.exe /C YN /M "Do you want StoreFront to display the servername? [Y/N]"
if errorlevel 2 goto :No

$SFVersion = Read-Host -Prompt 
$ThemeColour = Read-host -Prompt "Input Hex theme Colour one"
$ButtonColour = Read-Host -Prompt "Input Hex for Button Colour"
$HeaderColor =  Read-Host -Prompt "Inpurt Hex for post login Header Colour"
$colour = "FFFFFF"
Invoke-Expression ".\pixie.exe"
$Server = Read-Host -Prompt 'Input your server  name'
/ Invoke-Expression ".\pixie.exe"


(Get-Content style.css) | 
Foreach-Object {$_ -replace '#test',"$colour"}  | 
Out-File style.css



:No
