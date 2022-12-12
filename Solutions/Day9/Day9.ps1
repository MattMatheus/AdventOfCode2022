$RopeMoves = Get-Content ..\..\Inputfiles\day9input.txt

$HeadPos = [System.Tuple]::Create(0,0)
$TailPos = [System.Tuple]::Create(0,0)
$VisitedPositions = @()

# Item1 is 0 is X
# Item2 is 1 is Y

foreach($RopeMove in $RopeMoves){
    $MoveDirection = $RopeMove.Split(" ")[0]
    $MoveValue = $RopeMove.Split(" ")[1]
    #Move head
    switch($MoveDirection){
        'U' {
            $HeadPos.Item1 += $MoveValue
        }
        'D' {
            $HeadPos.Item1 -= $MoveValue
        }
        'R' {
            $HeadPos.Item2 += $MoveValue
        }
        'L' {
            $HeadPos.Item2 -= $MoveValue
        }
    }

    #Check tail and move if needed
    switch($HeadPos){
        ($HeadPos.Item1 -gt $TailPos.Item1){

        }
    }

}
