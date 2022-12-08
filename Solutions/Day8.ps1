$TheField = Get-Content ..\Inputfiles\day8input.txt
$Visible = 0
foreach($Row in $TheField){
    $Row = $Row.ToCharArray()
    $LastColumn = $Null
    foreach($Column in $Row){
        if($Row.Indexof($Column) -eq 0){
            $LastColumn = $Column
            Write-Output "Set first column at index $($Row.IndexOf($Column))"
            Break
        }
        elseif($Column -gt $LastColumn){
            $Visible += 1
            Write-Output "Found visible tree from left at row $($TheField.IndexOf($Row))"
        }
        else{
            break
        }
    }
}