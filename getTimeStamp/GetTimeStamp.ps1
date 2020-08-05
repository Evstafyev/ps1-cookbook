function Get-TimeStamp {

    <#
        .SYNOPSIS
			Function return specific timestamp. Timestamp type depends on flag.

        .INPUTS
			flag number

        .OUTPUTS
            Timestamp formats:
            
            1. MM-dd-yyyy
            2. HH:mm:ss
            3. HH-mm

        .EXAMPLE
            Get-TimeStamp -type 1
    #>

    Param(
    [int]$type
    )
    switch ($type) {
        0 {return "{0:MM-dd-yyyy}" -f (Get-Date)}
        1 {return "{0:HH:mm:ss}" -f (Get-Date)}
        2 {return "{0:HH-mm}" -f (Get-Date)}
    }    
}