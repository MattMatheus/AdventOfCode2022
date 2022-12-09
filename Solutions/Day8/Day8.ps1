$TheField = Get-Content ..\..\Inputfiles\day8input.txt
$VisibleTrees = 0


for($Y=0; $Y -lt $TheField.Length; $Y++){
    for($X=0; $X -lt $TheField[$Y].Length; $X++){
        if(($Y -eq 0) -or ($Y -eq $TheField.Length-1) -or ($X -eq 0) -or ($X -eq $TheField[0].Length-1)){
            $VisibleTrees++
            continue
        }
        else {
            $RightToLeft = $TheField[$Y][$($X+1)..$($TheField[$Y].Length)]
            $LeftToRight = $Thefield[$Y][0..$($x-1)]
            $TopToBottom = $TheField | ForEach-Object {$_[$x]} | Select-Object -First $Y
            $BottomToTop = $TheField | ForEach-Object {$_[$x]} | Select-Object -Last ($TheField.Length-1 - $Y)

            # Find Matches for each set
            for($z=0; $z -lt $RightToLeft.Count; $z++){
                if([int]("$($RightToLeft[$z])") -ge [int]("$($thefield[$Y][$x])")){
                    $FoundBigger++
                    break
                }
            }
            for($z=0; $z -lt $LeftToRight.Count; $z++){
                if([int]("$($LeftToRight[$z])") -ge [int]("$($thefield[$Y][$x])")){
                    $FoundBigger++
                    break
                }
            }
            for($z=0; $z -lt $TopToBottom.Count; $z++){
                if([int]("$($TopToBottom[$z])") -ge [int]("$($thefield[$Y][$x])")){
                    $FoundBigger++
                    break
                }
            }
            for($z=0; $z -lt $BottomToTop.Count; $z++){
                if([int]("$($BottomToTop[$z])") -ge [int]("$($thefield[$Y][$x])")){
                    $FoundBigger++
                    break
                }
            }
            if($FoundBigger -lt 4){
                $VisibleTrees++
            }
        }
    }
}
Write-Output "There are $($VisibleTrees) trees."
