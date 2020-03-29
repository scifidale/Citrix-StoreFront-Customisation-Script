#Requires -RunAsAdministrator


# Citrix StoreFront customisation guide 
Invoke-Expression ".\pixie.exe"




$SFStore = Read-Host -Prompt "Input Store name, Example StoreWeb"
CLS
$ThemeColour = Read-host -Prompt "Input Hex theme Colour one"
CLS
$ButtonColour = Read-Host -Prompt "Input Hex for Button Colour"
CLS
$HeaderColor =  Read-Host -Prompt "Inpurt Hex for post login Header Colour"
CLS
$Server = Read-Host -Prompt 'Input your server  name'
CLS

#$Footer = Read-Host -Prompt "Do you want StoreFront to display the server name in the footer? [Y/N]"
#if ( $Footer -eq 'Y') {
#$CSSsource = 'footer'} ELSE {
#$CSSsource = 'standard'}
#get-content -path footer\script.txt | add-content -path Custom\script.css

Robocopy Source Custom style.css
Robocopy Source Custom script.js

$Footer = Read-Host -Prompt "Do you want StoreFront to display the server name in the footer? [Y/N]"
if ( $Footer -eq 'Y') {
get-content -path footer\script.txt | add-content -path Custom\script.js
get-content -path footer\style.txt | add-content -path Custom\style.css
Add-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "SF-ServerName" ; value = "$Server" }
} 



#/* Select Graphic
Add-Type -AssemblyName System.Windows.Forms
$Image = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$null = $FileBrowser.ShowDialog()
$Image = $FileBrowser | select-object FileName | FT -HideTableHeaders
Robocopy $Image Custom
#/* Server configuration block for no server name in footer



(Get-Content Custom\style.css) | 
Foreach-Object {$_ -replace 'FFBD14',"$ThemeColour"}  | 
Out-File Custom\style.css

(Get-Content Custom\style.css) | 
Foreach-Object {$_ -replace 'FFBD15',"$ButtonColour"}  | 
Out-File Custom\style.css

(Get-Content Custom\style.css) | 
Foreach-Object {$_ -replace 'FFBD16',"$HeaderColour"}  | 
Out-File Custom\style.css

#/* UK English Selection


$UKE = Read-Host -Prompt "Do you want StoreFront to display United Kingdom English? [Y/N]"
if ( $UKE -eq 'Y') {
Robocopy "Source" Custom strings.en.js}


#/* Deploy Custom Scripts to Storefront
Robocopy Custom c:\inetpub\wwwroot\Citrix\$SFStore\custom



#/* CODE BLOCKS 

#$test = Read-Host -Prompt "Do you want StoreFront to display United Kingdom English? [Y/N]"
#if ( $test -eq 'Y') {
#$dale = 'cool'} ELSE {
#$dale = 'not'}

