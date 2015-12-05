package main

import (
  "io/ioutil"
)

func main() {

  println("Advent of code: Day 1 - Go")

  input, err := ioutil.ReadFile("./input.txt")
  if err != nil {
    panic(err)
  }

  floor := 0
  basementFound := false
  basementPosition := 0

  for pos := 0; pos <= len(input); pos++ {
    move := string(input[pos:pos+1])
    if move == "(" {
      floor += 1
    } else if move == ")" {
      floor -= 1
    }
    if floor == -1 && !basementFound {
      basementFound = true
      basementPosition = pos+1
    }
  }

  println("Part One: Santa ended up on floor:", floor)
  println("Part Two: Santa entered the basement on position", basementPosition)
}
