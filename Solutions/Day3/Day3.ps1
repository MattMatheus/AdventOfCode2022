$RucksackList = Get-Content ..\Inputfiles\day3input.txt
$Priorities = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$PriorityTotal = 0

foreach($Rucksack in $RucksackList){
    $SplitPoint = $($Rucksack.Length)/2
    $ToCompartments = $Rucksack -split "(\w{$Splitpoint})"
    $CompartmentOne = $ToCompartments[1].ToCharArray()
    $CompartmentTwo = $ToCompartments[3].ToCharArray()
    $Samsies = @()
    foreach($ItemOne in $CompartmentOne){
        foreach($ItemTwo in $CompartmentTwo){
            if($ItemOne -ceq $ItemTwo){
                $Samsies += $ItemOne
            }
        }
    }
    $CommonItem = $Samsies[0]
    $Score = $($Priorities.IndexOf($CommonItem) + 1)
    $PriorityTotal += $Score
    
    Write-Host "This round item is $CommonItem, adding $score to Total"
    Write-Host "Total score is $($PriorityTotal)"
}

