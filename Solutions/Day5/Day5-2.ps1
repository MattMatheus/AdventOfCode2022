function Prepare{
    $Stack1 = New-Object System.Collections.Stack
    $Stack2 = New-Object System.Collections.Stack
    $Stack3 = New-Object System.Collections.Stack
    $Stack4 = New-Object System.Collections.Stack
    $Stack5 = New-Object System.Collections.Stack
    $Stack6 = New-Object System.Collections.Stack
    $Stack7 = New-Object System.Collections.Stack
    $Stack8 = New-Object System.Collections.Stack
    $Stack9 = New-Object System.Collections.Stack

    $Stack1Start = "FTCLRPGQ".ToCharArray()
    $Stack2Start = "NQHWRFSJ".ToCharArray()
    $Stack3Start = "FBHWPMQ".ToCharArray()
    $Stack4Start = "VSTDF".ToCharArray()
    $Stack5Start = "QLDWVFZ".ToCharArray()
    $Stack6Start = "ZCLS".ToCharArray()
    $Stack7Start = "ZBMVDF".ToCharArray()
    $Stack8Start = "TJB".ToCharArray()
    $Stack9Start = "QNBGLSPH".ToCharArray()

    foreach($Item in $Stack1Start){
        $Stack1.Push($Item)
    }
    foreach($Item in $Stack2Start){
        $Stack2.Push($Item)
    }
    foreach($Item in $Stack3Start){
        $Stack3.Push($Item)
    }
    foreach($Item in $Stack4Start){
        $Stack4.Push($Item)
    }
    foreach($Item in $Stack5Start){
        $Stack5.Push($Item)
    }
    foreach($Item in $Stack6Start){
        $Stack6.Push($Item)
    }
    foreach($Item in $Stack7Start){
        $Stack7.Push($Item)
    }
    foreach($Item in $Stack8Start){
        $Stack8.Push($Item)
    }
    foreach($Item in $Stack9Start){
        $Stack9.Push($Item)
    }

    $StartingState = [PSCustomObject]@{
        Stack1 = $Stack1
        Stack2 = $Stack2
        Stack3 = $Stack3
        Stack4 = $Stack4
        Stack5 = $Stack5
        Stack6 = $Stack6
        Stack7 = $Stack7
        Stack8 = $Stack8
        Stack9 = $Stack9
    }

    return $StartingState
}

$ElfCruiseShip = Prepare

#Process moves
$MoveList = Get-Content ..\Inputfiles\day5input.txt

foreach($Move in $MoveList){
    $MoveCount = $Move.Split(" ")[1]
    $FromStack = $Move.SPlit(" ")[3]
    $ToStack = $Move.Split(" ")[5]

    $TempStack = New-Object System.Collections.Stack

    while($Movecount -gt 0){
        $FromStackID = "Stack" + $FromStack
        $ToStackID = "Stack" + $ToStack
        $Item = $ElfCruiseShip.$FromStackID.Pop()
        $TempStack.Push($Item)
        $MoveCount -= 1
    }

    foreach($Item in $TempStack){
        $ElfCruiseShip.$ToStackID.Push($Item)
    }

}


Write-Host $ElfCruiseShip.Stack1.Peek()
Write-Host $ElfCruiseShip.Stack2.Peek()
Write-Host $ElfCruiseShip.Stack3.Peek()
Write-Host $ElfCruiseShip.Stack4.Peek()
Write-Host $ElfCruiseShip.Stack5.Peek()
Write-Host $ElfCruiseShip.Stack6.Peek()
Write-Host $ElfCruiseShip.Stack7.Peek()
Write-Host $ElfCruiseShip.Stack8.Peek()
Write-Host $ElfCruiseShip.Stack9.Peek()
