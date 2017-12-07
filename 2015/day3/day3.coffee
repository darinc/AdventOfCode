console.log 'Advent of Code: Day 3 - CoffeeScript'

fs = require 'fs'
input = fs.readFileSync('input.txt').toString()

x = 0; y = 0; sx = 0; sy = 0; rx = 0; ry = 0
p1_arr = [[0,0]]; p2_arr = [[0,0]]

for pos in [0..input.length]
  move = input.substring(pos, pos+1)

  #Part One
  x++ if move is '^'
  x-- if move is 'v'
  y++ if move is '>'
  y-- if move is '<'
  house = x + ',' + y
  if house not in p1_arr
    p1_arr.push house

  #Part Two
  if pos %% 2 == 0
    sx++ if move is '^'
    sx-- if move is 'v'
    sy++ if move is '>'
    sy-- if move is '<'
    house = sx + ',' + sy
  else
    rx++ if move is '^'
    rx-- if move is 'v'
    ry++ if move is '>'
    ry-- if move is '<'
    house = rx + ',' + ry
  if house not in p2_arr
    p2_arr.push house

console.log "Part one: unique houses that Santa visited: #{p1_arr.length}"
console.log "Part two: unique houses that (robo+)Santa visited: #{p2_arr.length}"
