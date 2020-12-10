
#Part 2
#look for 3 numbers that add up to 2020, multiply them together
$Entries | foreach-object {
  #$_ will be the "outer most" loop through the entries list
  foreach($item in $entries) {
    #$item is the second loop through the entries list
    foreach($number in $entries) {
      #$number is the third loop through Entries
      if([int]$_ + [int]$item + [int]$number -eq 2020) {
        [int]$_ * [int]$item * [int]$number
      }      
    }
  }
}