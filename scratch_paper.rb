=begin

input: array of strings
output: boolean

rules:
- return true if strings representing directions return you to coordinate in 10 min
- return false if strings return you to beginning in more or less than 10 min
- return false if strings do not return you to beginning

algorith:
- catch if the size of the array is not 10
- transate to coordinate system in an array with two integers
  - w or e modifies the first integer, n or s modifies the second
  - make sure coordinate array is [0, 0] at end

=end

def isValidWalk(walk)
  return false if walk.size != 10

  coordinate = [0, 0]
  walk.each do |direction|
    case direction
    when 'e'
      coordinate[0] += 1
    when 'w'
      coordinate[0] -= 1
    when 'n'
      coordinate[1] += 1
    when 's'
      coordinate[1] -= 1
    end
  end
  coordinate == [0, 0]
end

p isValidWalk(['n','s','n','s','n','s','n','s','n','s'])
p isValidWalk(['w','e','w','e','w','e','w','e','w','e','w','e'])
p isValidWalk(['n','n','n','s','n','s','n','s','n','s'])