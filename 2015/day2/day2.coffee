console.log 'Advent of Code: Day 2 - CoffeeScript'

fs = require 'fs'
input = fs.readFileSync('input.txt').toString()

total_sqft = 0
total_ribbon = 0

for present in input.split '\n'
  if present
    dimensions = present.split("x")
    d = []
    for i in [0..2]
      d[i] = parseInt dimensions[i]

    # sort smallest to largest
    d.sort (a,b) => a-b

    # s = small, m = medium, l = large (referring to side size)
    s = d[0]
    m = d[1]
    l = d[2]

    sqft = s*m*3 + s*l*2 + m*l*2
    ribbon = s*2 + m*2 + s*m*l

    total_sqft += sqft
    total_ribbon += ribbon

console.log "Part one: The elves need #{total_sqft} sq ft of wrapping paper"
console.log "Part one: The elves need #{total_ribbon} ft of ribbon"
