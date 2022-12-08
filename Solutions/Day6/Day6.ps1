$RadioSignals = Get-Content ..\InputFiles\Day6Input.txt
$SignalPosition = 0

Write-Output "Searchin' for signal..."
foreach($Item in (1..($RadioSignals.length))){
    $CurrentSet = $RadioSignals.ToCharArray() | Select-Object -Skip $SignalPosition -First 4
    $UniqueCount = $CurrentSet | Sort-Object | Get-Unique | Measure-Object
    if($UniqueCount.count -eq 4){
        Write-Host "Marker found at position $($SignalPosition + 4)"
        Break
    }
    else{
        $SignalPosition += 1
    }
}