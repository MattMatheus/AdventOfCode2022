$TheField = Get-Content ..\..\Inputfiles\day8input.txt
$Grid = @()
for($y=0; $y -lt $TheField.Length; $y++){
    for($x=0; $x -lt $TheField[$y].Length; $x++){
        $CurrentPosition = [PSCustomObject]@{
            Item = $TheField[$y][$x]
            xPos = $x
            yPos = $y
        }
        $Grid += $CurrentPosition
    }
}

$Depth = $TheField.Length
$Width = $TheField[0].Length

for($Y=0; $Y -lt $Depth; $Y++){
    for($X=0; $X -lt $Width; $X++){
        $RightToLeft = $Grid | Where-Object yPos -eq $Y
        $LeftToRight = New-Object System.Collections.Stack
        $RightToLeft | ForEach-Object $LeftToRight.Push($_)
        $TopToBottom = $Grid | Where-Object XPos -eq $X
        $BottomToTop = New-Object System.Collections.Stack
        $TopToBottom | ForEach-Object $BottomToTop.Push($_)

        Write-Output "...."
        Write-Output $RightToLeft
        Write-Output $LeftToRight
        Write-Output $TopToBottom
        Write-Output $BottomToTop
    }
}