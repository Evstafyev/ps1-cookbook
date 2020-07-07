# get random letter identifier

$str = 'ID'+ $(-join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})).ToString().ToUpper() + "$(1..100 | Get-Random)"

$str
