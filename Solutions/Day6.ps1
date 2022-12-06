$RadioSignals = Get-Content ..\InputFiles\Day6Input.txt
$SignalPosition = 0

foreach($Item in (1..($RadioSignals.length))){
    $CurrentSet = $RadioSignals.ToCharArray() | Select-Object -Skip $SignalPosition -First 4
    $UniqueCount = $CurrentSet | Sort-Object | Get-Unique | Measure-Object
    Write-Output "Current set is $($CurrentSet) with unique value of $($UniqueCount.count)"
    if($UniqueCount.count -eq 4){
        Write-Host "Marker found at position $($SignalPosition)"
        Break
    }
    else{
        $SignalPosition += 1
    }
}