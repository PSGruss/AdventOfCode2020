
$Entries = get-content .\Day1_input.txt

$Entries | Foreach-Object {
    #$_ is the value from the list on the first loop
    foreach($Number in $Entries) {
        #$Number is the value from the list on the second loop
        if([int]$_ + [int]$number -eq 2020) {
            [int]$_ * [int]$number
        }
    }
}
#Output will be the answer, twice!

