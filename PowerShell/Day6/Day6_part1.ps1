$input = get-content "$psscriptroot\Day6_input.txt"

$s = '---'
$Input_Join = $input -join $s

$output = [system.collections.generic.list[int]]::new()
foreach($row in ($input_join -split "$($s)$($s)")) {
    $row_replace = $row -replace $s,''
    $unique_Letters  = $row_replace.ToCharArray() | group-object | select-object -expand name
    $Unique_Letters_Row = $unique_Letters -join ''
    $output.add($Unique_Letters_Row.length)
}
$output | measure-object -sum | select -expand sum