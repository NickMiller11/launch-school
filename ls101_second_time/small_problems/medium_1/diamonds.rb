# Write a method that displays a 4-pointed diamond in an n x n grid, where n is 
# an odd integer that is supplied as an argument to the method. You may assume 
# that the argument will always be an odd integer.

=begin

Input: integer
Output: prints diamonds to the screen

Rules:
- input will always be an odd integer
- input will represent length of diamonds in middle row, with both top and bottom
  - tapering off until 1 diamond

Algorithm:
- start with 1 diamond in a string that is n / 2 plus diamond
- subtract a space and add two diamonds each time until number of diamonds == n
- reverse the logic and subtract diamonds, adding spaces

=end

def diamond(n)
  half_length = n/2
  diamonds_counter = 1
  spaces_counter = half_length
  
  loop do # grow diamond
    puts("#{' ' * spaces_counter}#{'*' * diamonds_counter}")
    break if spaces_counter == 0
    diamonds_counter += 2
    spaces_counter -= 1
    
  end
  
  loop do # shrink diamond
    break if diamonds_counter <= 1
    diamonds_counter -= 2
    spaces_counter += 1
    puts("#{' ' * spaces_counter}#{'*' * diamonds_counter}")
  end
  
end


diamond(1)
diamond(3)
diamond(9)