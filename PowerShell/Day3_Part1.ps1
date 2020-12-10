$input = get-content "$psscriptroot\Day3_input.txt"

$Map = new-object system.collections.generic.list[string[]]
$map.add($input)

do{
    $map = $map | foreach-object{
        $temp = $_ *= 2
        $temp
    }
}
Until ($map[-1].length -gt ($input.count * 3))

$Position = @(0,0)
$TreeCount = 0
do{
    $position[0] ++
    $position[1] = $position[1] + 3
    if(($map[$position[0]])[$position[1]] -match '#') {
        $treecount ++
    }
}
Until ($position[0] -ge $input.count)

write-output $Treecount