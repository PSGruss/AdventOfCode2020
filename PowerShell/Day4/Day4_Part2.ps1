$input = get-content "$psscriptroot\Day4_Input.txt"

$count = 0
$Sep = "---"
$Mod = $input.split(" ") -join $Sep
foreach($line in ($Mod -split "$($sep)$($sep)")) {
    $Match_CID = $line | select-string 'cid:'
    if(($line -split $sep).count -eq 8 -or (!$match_CID -and ($line -split $sep).count -eq 7)) {
        $count++
    }
}
$count