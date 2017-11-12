# Write a method that displays a 4-pointed diamond in an n x n grid, 
# where n is an odd integer that is supplied as an argument to the method. 
# You may assume that the argument will always be an odd integer.

# Input: integer
# Data: string interpolation
# Output: grid of strings

require 'pry'

EXTRA_DIAMONDS = '**'

def diamond(int)
  diamond = '*'
  
  loop do
    puts diamond.center(int)
    break if diamond.size == int
    diamond << EXTRA_DIAMONDS
  end
  
  loop do
    diamond.slice!(0, 2)
    break if diamond.size == 0
    puts diamond.center(int)
  end
  
end

diamond(11)