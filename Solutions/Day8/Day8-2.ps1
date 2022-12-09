$TheField = Get-Content ..\..\Inputfiles\day8input.txt

$output = @()
for($y=0; $y -lt $TheField.Length; $y++){
    for($x=0; $x -lt $TheField[$y].Length; $x++){
        $LeftDist,$RightDist,$TopDist,$BottomDist = 0
        $RightToLeft = $TheField[$y][$($x+1)..$($TheField[$y].Length)]
        $LeftToRight = $TheField[$y][0..$($x-1)]
        $topToBottom = $TheField | ForEach-Object {$_[$x]} | Select-Object -First $y
        $BottomToTop = $TheField | ForEach-Object {$_[$x]} | Select-Object -Last ($TheField.Length-1 - $y)

        if($y -ne 0) {
            for($z=$topToBottom.Count-1; $z -ge 0; $z--) {
                if([int]("$($topToBottom[$z])") -lt [int]("$($TheField[$y][$x])")) {$TopDist++}
                if([int]("$($topToBottom[$z])") -ge [int]("$($TheField[$y][$x])")) {$TopDist++; break}
            }
        }

        if($y -ne $TheField.Length-1) {
            for($z=0; $z -lt $BottomToTop.Count; $z++) {
                if([int]("$($BottomToTop[$z])") -lt [int]("$($TheField[$y][$x])")) {$BottomDist++}
                if([int]("$($BottomToTop[$z])") -ge [int]("$($TheField[$y][$x])")) {$BottomDist++; break}
            }
        }

        if($x -ne 0) {
            for($z=$LeftToRight.Count-1; $z -ge 0; $z--) {
                if([int]("$($LeftToRight[$z])") -lt [int]("$($TheField[$y][$x])")) {$LeftDist++}
                if([int]("$($LeftToRight[$z])") -ge [int]("$($TheField[$y][$x])")) {$LeftDist++; break}
            }          
        }

        if($x -ne $TheField[0].Length-1) {
            for($z=0; $z -lt $RightToLeft.Count; $z++) {
                if([int]("$($RightToLeft[$z])") -lt [int]("$($TheField[$y][$x])")) {$RightDist++}
                if([int]("$($RightToLeft[$z])") -ge [int]("$($TheField[$y][$x])")) {$RightDist++; break}
            }
        }

        $totalDistance = $LeftDist * $RightDist * $TopDist * $BottomDist
        $output += $totalDistance
    }
}
Write-Host "Total score is: $($output | Sort-Object -Descending | Select-Object -First 1)"