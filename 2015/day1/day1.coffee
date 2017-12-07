console.log 'Advent of Code: Day 1 - CoffeeScript'

fs = require 'fs'
input = fs.readFileSync('input.txt').toString()

floor = 0
basementFound = false
basementPosition = 0

ilen = input.length

for pos in [0..ilen]
  move = input.substring(pos, pos+1)
  floor++ if move == '('
  floor-- if move == ')'
  if floor == -1 and basementFound == false
    basementFound = true
    basementPosition = pos+1

console.log "Part one: Santa ended up on floor: #{floor}"
console.log "Part two: Santa entered the basement on position #{basementPosition}"
