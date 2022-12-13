$MonkeyOps = Get-Content ..\..\Inputfiles\day11input.txt

$MonkeyItems = [PSCustomObject]@{
    Monkey0 = [Array](80)
    Monkey1 = [Array](75, 83, 74)
    Monkey2 = [Array](86, 67, 61, 96, 52, 63, 73)
    Monkey3 = [Array](85, 83, 55, 85, 57, 70, 85, 52)
    Monkey4 = [Array](67, 75, 91, 72, 89)
    Monkey5 = [Array](66, 64, 68, 92, 68, 77)
    Monkey6 = [Array](97, 94, 79, 88)
    Monkey7 = [Array](77, 85)
}

$MonkeyInspectionCount = [PSCustomObject]@{
    Monkey0 = 0
    Monkey1 = 0
    Monkey2 = 0
    Monkey3 = 0
    Monkey4 = 0
    Monkey5 = 0
    Monkey6 = 0
    Monkey7 = 0
}

Function MonkeyAround($MonkeyNumber, $CurrentItem) {
    switch($MonkeyNumber){
        0 {
            # New = Old * 5
            Write-Output "Monkey 0"
            $MonkeyInspectionCount.Monkey0++
            $CurrentItem = ($CurrentItem *5) 
            $CurrentItem = [int][Math]::floor($CurrentItem/3) 
            if(($CurrentItem % 17) -eq 0){
                $MonkeyItems.Monkey4 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey3 += $CurrentItems
            }
        }
        1 {
            # New = old + 7
            Write-Output "Monkey 1"
            $MonkeyInspectionCount.Monkey1++
            $CurrentItem = ($CurrentItem + 7)
            $CurrentItem = [int][Math]::floor($CurrentItem/3)
            if(($CurrentItem % 7) -eq 0){
                $MonkeyItems.Monkey5 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey6 += $CurrentItem
            }
        }
        2 {
            # New = old + 5
            Write-Output "Monkey 2"
            $MonkeyInspectionCount.Monkey2++
            $CurrentItem = ($CurrentItem + 5)
            $CurrentItem = [int][Math]::floor($CurrentItem/3)
            if(($CurrentItem % 3) -eq 0){
                $MonkeyItems.Monkey7 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey0 += $CurrentItem
            }
        }
        3 {
            # New = old + 8
            Write-Output "Monkey 3"
            $MonkeyInspectionCount.Monkey3++
            $CurrentItem = ($CurrentItem + 8)
            $CurrentItem = [int][Math]::floor($CurrentItem/3)
            if(($CurrentItem % 17) -eq 0){
                $MonkeyItems.Monkey1 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey5 += $CurrentItem
            }
        }
        4 {
            # New = old + 4
            Write-Output "Monkey 4"
            $MonkeyInspectionCount.Monkey4++
            $CurrentItem = ($CurrentItem + 4)
            $CurrentItem = [int][Math]::floor($CurrentItem/3)
            if(($CurrentItem % 11) -eq 0){
                $MonkeyItems.Monkey3 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey1 += $CurrentItem
            }
        }
        5 {
            # New = old * 2
            Write-Output "Monkey 5"
            $MonkeyInspectionCount.Monkey5++
            $CurrentItem = ($CurrentItem * 2)
            $CurrentItem = [int][Math]::floor($CurrentItem/3)
            if(($CurrentItem % 19) -eq 0){
                $MonkeyItems.Monkey6 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey2 += $CurrentItem
            }
        }
        6 {
            # New = old * old
            Write-Output "Monkey 6"
            $MonkeyInspectionCount.Monkey6++
            $CurrentItem = ($CurrentItem * $CurrentItem)
            $CurrentItem = [int][Math]::floor($CurrentItem/3)
            if(($CurrentItem % 5) -eq 0){
                $MonkeyItems.Monkey2 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey7 += $CurrentItem
            }
        }
        7 {
            # New = old + 6
            Write-Output "Monkey 7"
            $MonkeyInspectionCount.Monkey7++
            $CurrentItem = ($CurrentItem + 6)
            $CurrentItem = [int][Math]::floor($CurrentItem/3)
            if(($CurrentItem % 13) -eq 0){
                $MonkeyItems.Monkey4 += $CurrentItem
            }
            else {
                $MonkeyItems.Monkey0 += $CurrentItem
            }
        }
    }
}

for($MonkeyRound=0; $MonkeyRound -lt 21; $MonkeyRound++){
    $MonkeyNumber = 0
    foreach($Monkey in $MonkeyItems.PSObject.Properties){
        foreach($Item in $Monkey){
            MonkeyAround($MonkeyNumber, $Item)
            Write-Output "Here"
        }
        $MonkeyNumber++
    }
}

Write-Output $MonkeyInspectionCount