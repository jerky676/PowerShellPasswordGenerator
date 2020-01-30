$specialchars = [char[]] ([char]33) + ([char]35..[char]38) + ([char]42..[char]43) + ([char]45..[char]46) + ([char]63..[char]64)
$uppercase =  [char[]] ([char]65..[char]90)
$lowercase = [char[]]([char]97..[char]122)
$numbers = [char[]] ([char]48..[char]57)
$allchars = [char[]] $specialchars + $uppercase + $lowercase + $numbers

function Get-CharGroup([int]$groupnumber){
    switch ($groupnumber) {
        1 { return $(Sort-Chars $specialchars) }
        2 { return $(Sort-Chars $uppercase) }
        3 { return $(Sort-Chars $numbers) }
        4 { return $(Sort-Chars $lowercase) }
        5 { return $(Sort-Chars $allchars)}
        default { return $(Sort-Chars $allchars)}
    }
}

function New-Password([int] $length){
    $randomsspots = @()

    for($i=1;$i -le 3; $i++){
        $randomsspots += $( Get-Random -Minimum 1  -Maximum $length)
    }

    $specchargroup=[int]1

    for($i=1; $i -le $length; $i++){
        if ($randomsspots.Contains($i)){
            $chargroup=$specchargroup
            $specchargroup++
            $specgroup=1
        } else {
            $chargroup=5
            $specgroup=0
        } 

        $newchar = $(Get-RandomChar $(Get-CharGroup $chargroup))

        if ( ($password.length -1) -ge 0){
            $lastchar=$($password[($password.length -1)].ToString().ToLower())
            $nextchar=$($password[($password.length -1)].ToString().ToLower())
            $testnewchar = $($newchar.ToString().ToLower())

            # write-host "$lastchar :: $nextchar :: $testnewchar"

            if ($lastchar -eq $testnewchar){
                $newchar = $(Get-RandomChar $(Get-CharGroup $chargroup))
            } elseif ($lastchar -eq $testnewchar ){
                $newchar = $(Get-RandomChar $(Get-CharGroup $chargroup))
            } elseif ($nextchar -eq $testnewchar){
                $newchar = $(Get-RandomChar $(Get-CharGroup $chargroup))
            }
        }
        $password += $newchar
    }
 
    return $password
}


function Get-RandomChar([char[]]$chars){
    $randomnumber=$( Get-Random -Minimum 0  -Maximum $($chars.length - 1))
    return $chars[$randomnumber]
}

function Sort-Chars([char[]]$chars){
    return (($chars | Sort-Object {Get-Random}) -join '')
}


function Remove-Characters([string] $originalString,[string]$specialChars="$%\/@+&^#{}()"){
    $regex="[$specialChars]"

    if ( $originalString -match $regex)
    {
        $newString=""
        foreach($letter in $originalString.toCharArray())
        {
            if ($letter -match $regex)
            { 
                $newString+=$(Get-RandomChar)
            } else {
                $newString+=$letter
            }
        }
        return $newString
    }
    else {
        return $originalString
    }

}

