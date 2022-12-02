$Datum = get-Content .\Inputfiles\day1input.txt
$elfPosition = 1
$totalLoads = @()

foreach($data in $datum){
    if([int]$data -ne 0){
        $elfLoad += [int]$data
    }
    else {
        $outputObject = [PSCustomObject]@{
            ElfPosition = $ElfPosition
            ElfLoad = $elfLoad
        }
        $totalLoads += $outputObject
        $elfPosition += 1
        $elfLoad = 0
    }
}

$highestElf = $totalLoads | Sort-Object -Property ElfLoad
$topElves = ($highestElf[-1].ElfLoad) + ($highestElf[-2].ElfLoad) + ($highestElf[-3].ElfLoad)

Write-Output "Most Loaded Elf is at position $($highestElf[-1].ElfPosition) with load of $($highestElf[-1].ElfLoad)"
Write-Output "The total for our top 3 elves is $($topElves)"