<?php

  echo "Advent of code: Day 1 - PHP\n";

  $floor = 0;
  $basementFound = false;
  $basementPosition = 0;

  $input = file_get_contents("input.txt");

  for($pos=0; $pos<= strlen($input); $pos++) {
    $move = substr($input, $pos, 1);
    if ( $move == '(' ) {
      $floor++;
    } else if ( $move == ')' ) {
      $floor--;
    }
    if ( $floor == -1 && !$basementFound ) {
      $basementFound = true;
      $basementPosition = $pos+1;
    }
  }

  print("Part One: Santa ended up on floor: " . $floor. "\n");
  print("Part Two: Santa entered the basement on position " . $basementPosition . "\n");
?>
