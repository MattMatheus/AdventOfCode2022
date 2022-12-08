$CleaningAssignments = Get-Content ..\InputFiles\Day4Input.txt
$OverLap = 0
foreach($CleaningAssignment in $CleaningAssignments){
    $ElfOne = $CleaningAssignment.Split(',')[0]
    [int]$ElfOneStart = $ElfOne.Split("-")[0]
    [int]$ElfOneEnd = $ElfOne.Split("-")[1]

    $ElfTwo = $CleaningAssignment.Split(',')[1]
    [int]$ElfTwoStart = $ElfTwo.Split("-")[0]
    [int]$ElfTwoEnd = $ElfTwo.Split("-")[1]
    if(($ElfOneStart -eq $ElfTwoStart) -and ($ElfOneEnd -eq $ElfTwoEnd)){
        $Overlap += 1
    }
    else{
        if(($ElfOneStart -le $ElfTwoStart) -and ($ElfOneEnd -ge $ElfTwoEnd)){
            $OverLap += 1
            Write-Output "Elf One $($ElfOne) contains Elf Two $($ElfTwo)"
        }
        if(($ElfTwoStart -le $ElfOneStart) -and ($ElfTwoEnd -ge $ElfOneEnd)){
            $OverLap += 1
            Write-Output "Elf Two $($ElfTwo) contains Elf One $($ElfOne)"
        }
    }
}

Write-Output "Overlap is $($OverLap)"