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

/Logon banner image
.logon-logo-container {
    background-image: url(../images/1x/CitrixStoreFront_auth_14B96BFF2B0A6FF8.png);
}

.web-screen {
    background-color: #161619;
    background-image: url(../images/common/ReceiverFullScreenBackground_46E559C0E6B5A27B.jpg);
    background-size: 100% 100%;
    min-height: 400px;
    height: auto!important;
    height: 400px;
}