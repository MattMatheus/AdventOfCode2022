$CleaningAssignments = Get-Content ..\InputFiles\Day4Input.txt
$OverLap = 0
foreach($CleaningAssignment in $CleaningAssignments){
    $ElfOne = $CleaningAssignment.Split(',')[0]
    [int]$ElfOneStart = $ElfOne.Split("-")[0]
    [int]$ElfOneEnd = $ElfOne.Split("-")[1]

    $ElfTwo = $CleaningAssignment.Split(',')[1]
    [int]$ElfTwoStart = $ElfTwo.Split("-")[0]
    [int]$ElfTwoEnd = $ElfTwo.Split("-")[1]

    $ElfOneRange = $ElfOneStart..$ElfOneEnd
    $ElfTwoRange = $ElfTwoStart..$ElfTwoEnd

    foreach($ElfOneItem in $ElfOneRange){
        foreach($ElfTwoItem in $ElfTwoRange){
            if($ElfOneItem -eq $ElfTwoItem){
                $DoesOverLap = 1
                Break
            }
        }
    }

    if($DoesOverLap -eq 1){
        $OverLap += 1
    }

    $DoesOverLap = 0

}

Write-Output "Overlap is $($OverLap)"