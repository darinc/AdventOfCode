print "Advent of code: Day 3 - Python"

file = open('input.txt')
input = file.read()

ilen = len(input)

x, y, sx, sy, rx, ry = 0, 0, 0, 0, 0, 0
p1_arr, p2_arr = [[0,0]], [[0,0]]

for pos in range(len(input)):
  move = input[pos]
  # Part One
  if move == '^': x+=1
  elif move == 'v': x-=1
  elif move == '>': y+=1
  elif move == '<': y-=1
  house = [x,y]
  if house not in p1_arr:
    p1_arr.append(house)

  # Part Two
  if pos % 2 == 0:
    if move == '^': sx+=1
    elif move == 'v': sx-=1
    elif move == '>': sy+=1
    elif move == '<': sy-=1
    house = [sx,sy]
  else:
    if move == '^': rx+=1
    elif move == 'v': rx-=1
    elif move == '>': ry+=1
    elif move == '<': ry-=1
    house = [rx,ry]
  if house not in p2_arr:
    p2_arr.append(house)

print "Part One: unique houses that Santa visited: %r " % len(p1_arr)
print "Part Two: unique houses that (robo+)Santa visited: %r " % len(p2_arr)
