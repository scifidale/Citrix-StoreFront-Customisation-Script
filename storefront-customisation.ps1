/* Citrix StoreFront customisation guide 
Invoke-Expression ".\pixie.exe"

Choice.exe /C YN /M "Do you want StoreFront to display the servername? [Y/N]"
if %errorlevel% 2 goto :No

Invoke-Expression ".\pixie.exe"
$SFStore = Read-Host -Prompt "Input Store name"
$ThemeColour = Read-host -Prompt "Input Hex theme Colour one"
$ButtonColour = Read-Host -Prompt "Input Hex for Button Colour"
$HeaderColor =  Read-Host -Prompt "Inpurt Hex for post login Header Colour"


$Server = Read-Host -Prompt 'Input your server  name'



/* Select Graphic
Add-Type -AssemblyName System.Windows.Forms
$Image = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$null = $FileBrowser.ShowDialog()
$Image | select-object FileName | FT -HideTableHeaders

/* Server configuration block for no server name in footer



(Get-Content style.css) | 
Foreach-Object {$_ -replace '#FFBD14',"$ThemeColour"}  | 
Out-File style.css

(Get-Content style.css) | 
Foreach-Object {$_ -replace '#FFBD15',"$ButtonColour"}  | 
Out-File style.css

(Get-Content style.css) | 
Foreach-Object {$_ -replace '#FFBD16',"$HeaderColour"}  | 
Out-File style.css

/* UK English Selection


$test = Read-Host -Prompt "Do you want StoreFront to display United Kingdom English? [Y/N]"
if ( $test -eq 'Y') {
$dale = 'cool'} ELSE {
$dale = 'not'}


robocopy copy "strings.en" "c:\inetpub\wwwroot\Citrix\$SFStore"

:NFNUK

Robocopy $Image "c:\inetpub\wwwroot\Citrix\$SFStore"

:No





/* CODE BLOCKS 

$test = Read-Host -Prompt "Do you want StoreFront to display United Kingdom English? [Y/N]"
if ( $test -eq 'Y') {
$dale = 'cool'} ELSE {
$dale = 'not'}

