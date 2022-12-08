$TerminalOutput = Get-Content ..\Inputfiles\day7input.txt
$Filesystem = @{}
$FileSystem.'/' = [SystemCollections.Generic.List[object]]::new()

$CurrentLocation = '/'

foreach ($Line in $TerminalOutput){
    $Command,$FileName,$FileSize = $null
    $CommandObject = $Line.Split(" ")
    
    # Process commands
    switch ($CommandObject[0]){
        '$' {
            $Command = $CommandObject[1]
            $Location = $CommandObject[2]
            Write-Output "Found Command $($Command)"
            break
        }
        'dir' {
            break
        }
        'ls' {
            break
        }
        default {
            [int]$FileSize = $CommandObject[0]
            [string]$FileName = $CommandObject[1]
            Write-Output "Found file $($FileName) with size $($FileSize)"
            break
        }
    }

    # Handle location commands
    switch($Command){
        'cd' {
            switch($Location){
                '..' {
                    $CurrentLocation,$Null = $CurrentLocation.Split('w\+/$')
                    break
                }
                '/' {
                    $CurrentLocation = '/'
                    break
                }
                default {
                    $CurrentLocation += "$($CurrentLocation)/$($CommandObject[2])"
                    break
                }
            }
        }
    }
    Write-Output "Currently at $($CurrentLocation)"
}