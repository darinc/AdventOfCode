print "Advent of code: Day 1 - Python"

file = open('input.txt')
input = file.read()

ilen = len(input)

floor = 0
foundBasement = False
basementPosition = 0

for pos in range(ilen):
  move = input[pos]
  if move == '(':
    floor = floor+1
  if move == ')':
    floor = floor-1
  if floor == -1 and foundBasement is False:
      foundBasement = True
      basementPosition = pos+1

print "Part One: Santa ended up on floor: %r " % floor
print "Part Two: Santa entered the basement on position %r" % basementPosition
