#Part 2
#the number identifies the character value for the letter
#the letter needs to exist in exactly one of those positions.
$i = 0
foreach($password in $entries) {
  $split = $password.split(" ")
  [int]$P1 = $split[0].split("-")[0]
  [int]$P2 = $split[0].split("-")[-1]
  $char = $split[1].split(":")[0]
  $pass = $split[2]
  
  if($pass[$p1-1] -match $char -or $pass[$p2-1] -match $char) {
    if($pass[$p1-1] -match $char -and $pass[$p2-1] -match $char){}
    Else{
      $i++
    }
  }
}