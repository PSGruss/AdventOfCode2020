$input = get-content "$psscriptroot\Day5_input.txt"

#Boarding a plane

$AllSeats = @()

foreach($row in $input) {
    $Seat = @{X = 0;Y = 0}
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
            $seat['Y'] += $y
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
            $seat['X'] += $x
            # divide $x value in half
            $x /= 2
        }
    }
    $SeatID = ($Seat['Y']) * 8 + ($Seat['X'])
    $AllSeats += $SeatID
}
$AllSeats | sort | select -last 1

