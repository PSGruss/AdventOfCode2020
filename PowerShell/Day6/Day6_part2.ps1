$input = get-content "$psscriptroot\Day6_input.txt"

$s = '---'
$Input_Join = $input -join $s

$output = [system.collections.generic.list[int]]::new()
foreach($row in ($input_join -split "$($s)$($s)")) {
    #Seperate string into the group answer
    $GroupAnswer = $Row -split $s
    #consolidate group answer into row of letters
    $row_replace = $row -replace $s,''
    #get the answers that is shared with each group member
    $unique_Letters = $row_replace.ToCharArray() | group-object | ?{$_.count -match $GroupAnswer.count} 
    #Count the number of matching letters.
    #Note, $unique_letters has a property called Count, so measure-object is used to count the letters.
    $a = $unique_Letters | measure-object | select -expand Count
    $output.add($a)
}
$output | measure-object -sum | select -expand sum