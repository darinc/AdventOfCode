print("Advent of Code: Day 6 - Lua")
-- create a matrix of lights
lights = {}
lights_p2 = {}
for i=0,999 do
  lights[i] = {}
  lights_p2[i] = {}
  for j=0,999 do
    lights[i][j] = 0  -- all lights start off
    lights_p2[i][j] = 0  -- all lights start off
  end
end


-- read Santa's input
lines = {}
for line in io.lines("input.txt") do
  lines[#lines + 1] = line

  -- the 7th position indicates the action
    -- " " = toggle:
    -- "n" = turn on
    -- "f" = turn off
  command = string.sub(line,7,7)

  if     command == " " then start_pos = 8; action = 2 -- toggle
  elseif command == "n" then start_pos = 9; action = 1 -- on
  elseif command == "f" then start_pos = 10; action = 0 -- off
  end

  start_coords = string.sub(line, start_pos, string.find(line, " ", start_pos))
  end_coords = string.sub(line, string.len(line)-string.find(line:reverse(), " ")+2, string.len(line))

  startx = string.sub(start_coords, 0, string.find(start_coords,",")-1)
  starty = string.sub(start_coords, string.find(start_coords,",")+1, string.len(start_coords))

  endx = string.sub(end_coords, 0, string.find(end_coords,",")-1)
  endy = string.sub(end_coords, string.find(end_coords,",")+1, string.len(end_coords))

  -- print(action, start_coords, end_coords)

  for i=startx,endx do
    for j=starty,endy do
      if action == 2 then

        -- part one toggle the lights
        if lights[i][j] == 0 then lights[i][j] = 1
        else lights[i][j] = 0
        end

        -- part two "moar light!!"
        lights_p2[i][j] = lights_p2[i][j] + 2

      elseif action == 1 then

          lights[i][j] = 1
          lights_p2[i][j] = lights_p2[i][j] + 1

      else

        lights[i][j] = 0
        -- check to see if the lights are off.. can't go below off
        if lights_p2[i][j] > 0 then
         lights_p2[i][j] = lights_p2[i][j] -1
        end

      end
    end
  end
end

-- Part one, find out how many lights are light
lights_lit = 0
for i=0,999 do
  for j=0,999 do
    if lights[i][j] == 1 then lights_lit = lights_lit + 1 end
  end
end

print("Part one: after following all of Santa's directions there are", lights_lit, "lights lit")

-- Part two, what is the total brightness
brightness = 0
for i=0,999 do
 for j=0,999 do
   brightness = brightness + lights_p2[i][j]
 end
end

print("Part two: total brightness is ", brightness)
