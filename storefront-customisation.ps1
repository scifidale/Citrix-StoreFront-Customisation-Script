$colour = "FFFFFF"
Invoke-Expression ".\pixie.exe"
$Server = Read-Host -Prompt 'Input your server  name'
Invoke-Expression ".\pixie.exe"


(Get-Content style.css) | 
Foreach-Object {$_ -replace '#test',"$colour"}  | 
Out-File style.css