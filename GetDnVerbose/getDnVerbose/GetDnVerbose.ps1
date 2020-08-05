function Get-DnVerbose {

    <#
        .SYNOPSIS
            Function used for transform DN AD string
            in format like my.domain.ru/L1/L2/.../Ln .
        
        .INPUTS
            DN string, include all RDN

            OU=L3,OU=L3,OU=L4,DC=my,DC=domain,DC=ru

        .OUTPUTS
            my.domain.ru/L1/L2/L3

        .EXAMPLE
            Get-DataPath -dnStr 'OU=Ln,OU=...,OU=L3,OU=L4,DC=my,DC=domain,DC=ru'
    #>

    Param(
    [Parameter(Mandatory=$false)]
    [string]$dnStr
    )

    $dnStr = $dnStr + ','

    $pattern = [regex]::new('(?<=,DC=)(.*?),')

    $match = $pattern.Matches($dnStr)

    $dcL1Dmn = $match.Groups[5].Value

    $dcL2Dmn = $match.Groups[3].Value

    $dcL3Dmn = $match.Groups[1].Value
    
    $dnStr = $dnStr -replace '(OU=)|(DC=)'

    $arrStr = $dnStr.Split(",")

    foreach($w in $arrStr) {

        if($w -like $dcL3Dmn){

            $domainStr += $w

            $domainStr += '.'

            $arrStr = $arrStr -ne $w

        }

        if($w -like $dcL2Dmn){

            $domainStr += $w

            $domainStr += '.'

            $arrStr = $arrStr -ne $w

        }

        if($w -like $dcL1Dmn){

            $domainStr += $w

            $arrStr = $arrStr -ne $w

        }

    }

    [array]::Reverse($arrStr)

    foreach($w in $arrStr) {

        $ouVrb += '/' + $w  

    }

    $dpVrb = $domainStr + $ouVrb
    
    return $dpVrb

}

Get-DataPath -dnStr $adSearchBase