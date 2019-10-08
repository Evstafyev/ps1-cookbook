#
# Export UserNames and AccountNames from specific OU in AD to CSV-file.
#
Get-ADUser -SearchBase 'OU=L3,OU=L2,OU=L1,DC=L3,DC=L2,DC=L1' -Filter '*' | 
% {
    $userName = $_.Name
	
    $accName = $_.SamAccountName
	
    write "$userName,$accName" | Out-File ad-users-list.csv -Append
}