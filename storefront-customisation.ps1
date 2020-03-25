/* Citrix StoreFront customisation guide 
Invoke-Expression ".\pixie.exe"




$SFStore = Read-Host -Prompt "Input Store name"
$ThemeColour = Read-host -Prompt "Input Hex theme Colour one"
$ButtonColour = Read-Host -Prompt "Input Hex for Button Colour"
$HeaderColor =  Read-Host -Prompt "Inpurt Hex for post login Header Colour"
$Server = Read-Host -Prompt 'Input your server  name'

$Footer = Read-Host -Prompt "Do you want StoreFront to display the server name in the footer? [Y/N]"
if ( $Footer -eq 'Y') {
$CSSsource = 'footer'} ELSE {
$CSSsource = 'standard'}
get-content -path 1.txt | add-content -path 2.txt



/* starting Colour picker applet
Invoke-Expression ".\pixie.exe"


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


$UKE = Read-Host -Prompt "Do you want StoreFront to display United Kingdom English? [Y/N]"
if ( $UKE -eq 'Y') {
Robocopy "Source" Custom strings.en.js} ELSE {
$UKE = 'nul'}




/* CODE BLOCKS 

$test = Read-Host -Prompt "Do you want StoreFront to display United Kingdom English? [Y/N]"
if ( $test -eq 'Y') {
$dale = 'cool'} ELSE {
$dale = 'not'}

