$RucksackList = Get-Content ..\Inputfiles\day3testinput.txt
$Priorities = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$PriorityTotal = 0
$SkipValue = 0
$GroupCount = $RucksackList.Length / 3


foreach($Group in (1..$GroupCount)){
    $GroupMembers = $RucksackList | Select-Object -Skip $SkipValue -First 3
    $SkipValue += 3
    foreach($GroupMember in $GroupMembers){
        $MemberOne = $GroupMembers[0]
        $MemberTwo = $GroupMembers[1]
        $MemberThree = $GroupMembers[2]
        $Sames = @()
        foreach($ItemOne in $MemberOne.ToCharArray()){
            foreach($ItemTwo in $MemberTwo.ToCharArray()){
                if($ItemOne -ceq $ItemTwo){
                    $Sames += $ItemOne
                }
            }
        }
        foreach($ItemThree in $MemberThree.ToCharArray()){
            foreach($SameItem in $Sames){
                if($ItemThree -ceq $SameItem){
                    $BadgeItem = $ItemThree
                }
            }
        }
    }
    $Score = $($Priorities.IndexOf($BadgeItem) + 1)
    $PriorityTotal += $Score
    
    Write-Host "This round item is $CommonItem, adding $score to Total"
    Write-Host "Total score is $($PriorityTotal)"
}







<#
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
#>