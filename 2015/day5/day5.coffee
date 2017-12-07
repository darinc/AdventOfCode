console.log 'Advent of Code: Day 5 - CoffeeScript'

fs = require 'fs'
input = fs.readFileSync('input.txt').toString()

# part one var
p1_nice_strings = 0

# part two vars
p2_nice_strings = 0
passed = []

for string in input.split '\n'
  if string
    s = string.split ''

    # part one vars
    vowels = 0
    badstring = false
    doubles = false

    # part two vars
    repeat = false

    for i in [0..s.length]
      if s[i] in ['a','e','i','o','u'] then vowels++

      if i < s.length-1
        if s[i]+s[i+1] in ['ab', 'cd', 'pq', 'xy'] then badstring = true

        if s[i] == s[i+1] then doubles = true

      # part two logic
      if i < s.length-2
        if s[i] == s[i+2] then repeat = true

    if vowels >= 3 and doubles and not badstring then p1_nice_strings++
    if repeat then passed.push string

console.log "Part one: There are #{p1_nice_strings} nice_strings"

very_nice_strings = 0
for w in passed
  doubles = 0
  for i in [0..w.length]
    if i < w.length-1
      loc = w.lastIndexOf(w.substring(i,i+2))
      if loc != i+1 and loc != i
        doubles++
        #console.log "#{w} with loc #{loc} for #{w.substring(i,i+2)}"
  if doubles > 0 then very_nice_strings++

console.log "Part two: There are #{very_nice_strings} very_nice_strings"
