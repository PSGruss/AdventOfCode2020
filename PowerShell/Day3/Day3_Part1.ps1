$input = get-content "$psscriptroot\Day3_input.txt"



$Position = @{X=0;Y=0}
$TreeCount = 0
do{
    $position['Y'] ++
    $position['X'] = $position['X'] + 3
    $XMod = $Position['X'] % $input[0].length
    if(($input[$position['y']])[$XMod] -match '#') {
        $treecount ++
    }
}
Until ($position['y'] -ge $input.count)

write-output $Treecount