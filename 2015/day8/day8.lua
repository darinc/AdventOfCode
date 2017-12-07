print("Advent of Code: Day 8 - Lua")

literal = 0
p1_mem = 0
p2_mem = 0


-- read Santa's list
lines = {}
for line in io.lines("input.txt") do
  lines[#lines + 1] = line

  literal = literal + string.len(line)
  print(line)
  hex = string.gsub(line,"\\x[%dabcdef][%dabcdef]","@") -- don't need the correct replacement, we are just counting
  -- print(hex)
  slash = string.gsub(hex,"\\.","#") -- don't need the correct replacement, we are just counting
  -- print(slash)
  p1_mem = p1_mem + string.len(slash)
  -- each input always has a starting quote and and ending quote, so subtract two from p1_mem
  p1_mem = p1_mem - 2
  -- print('-----p1----')

  -- part two
  added_slashes = string.gsub(line,"\\","\\\\")
  -- print(added_slashes)
  added_quotes = string.gsub(added_slashes,"\"","\\\"")
  -- print(added_quotes)
  p2_mem = p2_mem + string.len(added_quotes)
  -- each input always has a starting quote and and ending quote, so add two to p2_mem
  p2_mem = p2_mem + 2
  -- print('-----p2----')

end

---- Part one, find out the number of characters in string literal minus the characters in p1_memory
print("Part one: literal: ", literal, " mem: ", p1_mem, " diff: ", literal-p1_mem)
---- Part two, expand the string! new - literal
print("Part two: literal: ", literal, " mem: ", p2_mem, " diff: ", p2_mem-literal)
