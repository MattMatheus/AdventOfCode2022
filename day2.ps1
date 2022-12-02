$ListOfRounds = Get-Content -Path .\InputFiles\Day2input.txt

$MoveDecoder = [PSCustomObject]@{
    A = "Rock"
    B = "Paper"
    C = "Scissors"
    X = "Rock"
    Y = "Paper"
    Z = "Scissors"
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
    $MyMove = $MoveDecoder.($Round.Split(' ')[1])
    if($MyMove -eq "Rock"){
        if($TheirMove -eq "Paper"){
            $TheirScore += 6
        }
        elseif($TheirMove -eq "Scissors"){
            $MyScore += 6
        }
        else {
            $MyScore += 3
            $TheirScore += 3
        }
    }
    if($MyMove -eq "Paper"){
        if($TheirMove -eq "Scissors"){
            $TheirScore +=6
        }
        elseif($TheirMove -eq "Rock"){
            $MyScore +=6
        }
        else {
            $MyScore += 3
            $TheirScore += 3
        }
    }
    if($MyMove -eq "Scissors"){
        if($TheirMove -eq "Rock"){
            $TheirScore += 6
        }
        elseif($TheirMove -eq "Paper"){
            $MyScore += 6
        }
        else {
            $MyScore += 3
            $TheirScore += 3
        }
    }
    $MyScore += $ScoreList.$MyMove
    $TheirScore += $ScoreList.$TheirMove
    
    Write-Output "$MyMove vs $TheirMove - $MyScore vs $TheirScore"

}


Write-Host "My score is $($MyScore) their score is $($TheirScore)"