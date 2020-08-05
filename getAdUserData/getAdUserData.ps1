$adUsrSrch = 'OU=Ln,OU=..,OU=L2,OU=L1,DC=test,DC=domain,DC=com'

$getAdUsrEn = Get-ADuser -SearchBase $adUsrSrch -Filter {Enabled -Eq "True"} -ErrorVariable $adErr -ErrorAction Stop | Select GivenName,Surname,SID,UserPrincipalName

$getAdUsrEn | ogv