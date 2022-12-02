$ListOfRounds = Get-Content -Path .\InputFiles\Day2input.txt

$MoveDecoder = [PSCustomObject]@{
    A = "Rock"
    B = "Paper"
    C = "Scissors"
    X = "Lose"
    Y = "Draw"
    Z = "Win"
}

$ScoreList = [PSCustomObject]@{
    Rock = 1
    Paper = 2
    Scissors = 3
}

$MyScore = 0
$TheirScore = 0


foreach($Round in $ListOfRounds){
    $TheirMove = $MoveDecoder.($Round.Split(' ')[0])
    $Outcome = $MoveDecoder.($Round.Split(' ')[1])
    if($Outcome -eq "Win"){
        if($TheirMove -eq "Rock"){
            $MyMove = "Paper"
        }
        if($TheirMove -eq "Paper"){
            $MyMove = "Scissors"
        }
        if($TheirMove -eq "Scissors"){
            $MyMove = "Rock"
        }
        $MyScore += 6
    }
    if($Outcome -eq "Draw"){
        if($TheirMove -eq "Rock"){
            $MyMove = "Rock"
        }
        if($TheirMove -eq "Paper"){
            $MyMove = "Paper"
        }
        if($TheirMove -eq "Scissors"){
            $MyMove = "Scissors"
        }
        $MyScore += 3
        $TheirScore += 3
    }
    if($Outcome -eq "Lose"){
        if($TheirMove -eq "Rock"){
            $MyMove = "Scissors"
        }
        if($TheirMove -eq "Paper"){
            $MyMove = "Rock"
        }
        if($TheirMove -eq "Scissors"){
            $MyMove = "Paper"
        }
        $TheirScore += 6
    }
    $MyScore += $ScoreList.$MyMove
    $TheirScore += $ScoreList.$TheirMove
}


Write-Host "My score is $($MyScore) their score is $($TheirScore)"