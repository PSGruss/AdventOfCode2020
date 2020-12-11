$input = get-content "$psscriptroot\Day4_Input.txt"
#Add data Validation to Passports

$byr = @(1920,2002,'\d{4}')
$iyr = @(2010,2020,'\d{4}')
$eyr = @(2020,2030,'\d{4}')
$hgt_cm = @(150,193,'(\d{3})(cm)')
$hgt_in = @(59,76,'(\d{2})(in)')
$hcl = '(#)((\d|[a-f]){6})'
$ecl = '(amb|blu|brn|gry|grn|hzl|oth)'
$pid_regex = '(\d{9})'

$Valid = 0
$Present = 0

$Sep = "---"
$Mod = $input.split(" ") -join $Sep
foreach($line in ($Mod -split "$($sep)$($sep)")) {
    $Match_CID = $line | select-string 'cid:'
    $line_sep = $line -split $sep
    if($line_sep.count -eq 8 -or (!$match_CID -and $line_sep.count -eq 7)) {
        $Present ++
        $line_sep_hash = $line_sep | foreach-object {
            @{$_.split(":")[0]=$_.split(":")[1]}
        }
        $Byr_match = $line_sep_hash.byr | where-object {$_ -ge $byr[0] -and $_ -le $byr[1] -and $_ -match $byr[2]}
        $iyr_match = $line_sep_hash.iyr | where-object {$_ -ge $iyr[0] -and $_ -le $iyr[1 -and $_ -match $iyr[2]]}
        $eyr_match = $line_sep_hash.eyr | where-object {$_ -ge $eyr[0] -and $_ -le $eyr[1 -and $_ -match $eyr[2]]}
        $hgt_match = switch -regex ($line_sep_hash.hgt) {
            'cm' {$_ | where-object {[int]($_ -split 'cm')[0] -ge $hgt_cm[0] -and [int]($_ -split 'cm')[0] -le $hgt_cm[1] -and $_ -match $hgt_cm[2]}}
            'in' {$_ | where-object {[int]($_ -split 'in')[0] -ge $hgt_in[0] -and [int]($_ -split 'in')[0] -le $hgt_in[1] -and $_ -match $hgt_in[2]}}
            default {}
        }
        $hcl_match = $line_sep_hash.hcl | where-object {$_ -match $hcl}
        $ecl_match = $line_sep_hash.ecl | where-object {$_ -match $ecl}
        $pid_match = $line_sep_hash.pid | where-object {$_ -match $pid_regex -and $_.length -eq 9}

        if($byr_match -and $iyr_match -and $eyr_match -and $hgt_match -and $hcl_match -and $ecl_match -and $pid_match) {
            $Valid ++
        }
    }
}
write-output "Present: $Present"
write-output "Valide: $Valid"