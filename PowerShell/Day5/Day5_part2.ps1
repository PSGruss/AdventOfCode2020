$input = get-content "$psscriptroot\Day5_input.txt"

#Boarding a plane

$AllSeatIDs = @()
$AllSeats = @()
foreach($row in $input) {
    $Seat = [pscustomobject]@{SeatID="";X = 0;Y = 0}
    $x = 4
    $y = 64
    $row -split '' | foreach-object {
        if ($_ -match 'F'){
            # do not add value to $Seat
            # divide $y value
            $y /= 2
        }
        Elseif ($_ -match 'B'){
            # do add value to $Seat
            $seat.y += $y
            # divide $y value
            $y /= 2
        }
        Elseif ($_ -match 'L') {
            # do not add value to $Seat
            # divide $x value
            $x /= 2
        }
        Elseif ($_ -match 'R') {
            # do add value to $Seat
            $seat.x += $x
            # divide $x value in half
            $x /= 2
        }
    }
    $SeatID = ($Seat.y) * 8 + ($Seat.x)
    $seat.SeatID = $SeatID
    $AllSeats += $Seat    
    $AllSeatIDs += $SeatID
}
$AllSeats | group y | ?{$_.count -eq 7} | select -expand group

