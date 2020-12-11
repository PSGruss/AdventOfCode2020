$input = get-content "$psscriptroot\Day5_input.txt"

#Boarding a plane

$AllSeats = @()

foreach($row in $input) {
    $row
    $Seat = @{X = 0,Y = 0}
    $x = 8
    $y = 64
    foreach($letter in $row) {
        if ($letter -match 'F'){
            # do not add value to $Seat
            # divide $y value
            $y /= 2
        }
        Elseif ($letter -match 'B'){
            # do add value to $Seat
            $seat['Y'] += $y
            # divide $y value
            $y /= 2
        }
        Elseif ($letter -match 'L') {
            # do not add value to $Seat
            # divide $x value
            $x /= 2
        }
        Elseif ($letter -match 'R') {
            # do add value to $Seat
            $seat['X'] += $x
            # divide $x value in half
            $x /= 2
        }
    }
    $SeatID = $Seat['X'] * 8 + $Seat['Y']
    $AllSeats += $SeatID
}
$AllSeats

