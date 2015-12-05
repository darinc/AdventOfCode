print ("Advent of code: Day 1 - Perl\n");

open FILE, "input.txt" or die $!;

$floor = 0;
$basementFound = 0;
$basementPosition = 0;

my ($pos, $data, $n);
$pos = 0;
while (($n = read FILE, $data, 1) != 0) {
  if($data eq '(') {
    $floor++;
  } elsif($data eq ')') {
    $floor--;
  }
  if($floor == -1 && $basementFound == 0) {
    $basementFound = 1;
    $basementPosition = $pos+1;
  }
  $pos++;
}

print ("Part One: Santa ended up on floor: ", $floor, "\n");
print ("Part Two: Santa entered the basement on position ", $basementPosition, "\n");

close(FILE);
