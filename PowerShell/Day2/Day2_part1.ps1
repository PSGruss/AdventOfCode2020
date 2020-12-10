#Day 2 of Advent of Code
$Entries = get-clipboard

$i = 0

foreach($item in $entries) {
  $split = $item.split(" ")
  $min = $split[0].split("-")[0]
  $max = $split[0].split("-")[-1]
  $char = $split[1].split(":")[0]
  $pass = $split[2]
  
  $count = ([regex]::Matches($pass,$char)).count
  if($count -ge $min -and $count -le $max) {
    $i++
  }
}
#$i returns the number of valid passwords