# Write a method that takes a string as argument, and returns true if all 
# parentheses in the string are properly balanced, false otherwise. To be 
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

=begin

Input: string
Output: boolean

Rules:
- return a boolean
  - true if equal number of left and right parenthesis 
  - plus, true if left parenthesis always comes before matching right parenthesis
  - return false otherwise

Algorithm:

- create a counter
- iterate through string
  - add 1 if there is a left parenthesis
  - subtract 1 if there is a right parenthesis
- return false if counter becomes minus or ends not at 0

=end

def balanced?(str)
  counter = 0
  str.each_char do |char|
    if char == "("
      counter += 1
    elsif char == ")"
      counter -= 1
    end
    return false if counter < 0
  end
  counter == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false