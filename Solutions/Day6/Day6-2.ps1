$RadioSignals = Get-Content ..\InputFiles\Day6Input.txt
$SignalPosition = 0

Write-Output "Searchin' for messages..."
foreach($Item in (1..($RadioSignals.length))){
    $CurrentSet = $RadioSignals.ToCharArray() | Select-Object -Skip $SignalPosition -First 14
    $UniqueCount = $CurrentSet | Sort-Object | Get-Unique | Measure-Object
    if($UniqueCount.count -eq 14){
        Write-Host "Marker found at position $($SignalPosition + 14)"
        Break
    }
    else{
        $SignalPosition += 1
    }
}