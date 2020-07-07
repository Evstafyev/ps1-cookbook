$HKLM = 2147483650

$server = 'HOST1'

$user = Read-Host "Enter domain\username"

$pass = Read-Host -AsSecureString

$userCredentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user,$pass

$objReg = Get-WmiObject -List -Namespace root\default -ComputerName $server -Credential $userCredentials | 
Where-Object{$_.Name -eq "StdRegProv"}

$subKeyNames = $objReg.EnumValues($HKLM,"SYSTEM\ControlSet001\Control\Keyboard Layouts").sNames

Write-host $subKeyNames