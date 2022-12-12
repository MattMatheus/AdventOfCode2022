$Instructions = Get-Content ..\..\Inputfiles\day10input.txt
[int]$Cycle, [int]$XRegister, [int]$SignalStrength = 0
$ImportantTotal = New-Object System.Collections.Stack

function CheckCycleCount {
    $ImportantCycles = (20,60,100,140,180,220)
    if($Cycle -in $ImportantCycles){
        Write-Output "Value of register is $($XRegister) at cycle $($Cycle)"
        $ImportantTotal.Push($XRegister * $Cycle)
        Write-Output "Important total is $($ImportantTotal)"

    }

}

foreach($Instruction in $Instructions){
    $InstructionOp = $Instruction.Split(" ")[0]
    [int]$InstructionValue = $Instruction.Split(" ")[1]

    switch($InstructionOp){
        'noop' {
            $Cycle += 1
            CheckCycleCount
        }
        'addx' {
            $Cycle += 1
            CheckCycleCount
            $Cycle += 1
            CheckCycleCount
            $XRegister += $InstructionValue
            CheckCycleCount
            Write-Output "After cycle $($Cycle) modifying register by $($InstructionValue) to $($XRegister)"
        }
    }
}

foreach($Item in $ImportantTotal){
    $SignalStrength += [int]$Item
}

Write-Output $SignalStrength