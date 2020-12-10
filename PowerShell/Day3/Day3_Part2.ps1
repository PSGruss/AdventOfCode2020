$input = get-content "$psscriptroot\Day3_input.txt"


$Trajectory = @(
    @{X=1;Y=1}
    @{X=3;Y=1}
    @{X=5;Y=1}
    @{X=7;Y=1}
    @{X=1;Y=2}
)

$Result = 1
foreach($item in $Trajectory) {
    write-output "Map width: $($input[-1].length)"
    write-output "Map height: $($input.count * $item['x'])"
    
    $Position = @{X=0;Y=0}
    $TreeCount = 0
    do{
        $position['y'] = $position['y'] + $item["Y"]
        $position['x'] = $position['x'] + $item["X"]
        $XMod = $position['x'] % $input[0].length
        if(($input[$position['y']])[$XMod] -match '#') {
            $treecount ++
        }
    }
    Until ($position['y'] -gt $input.count)
    $Result = $Result *  $TreeCount
}
write-output $Result

