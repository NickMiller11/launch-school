# Write a method that takes a string as argument, and returns true
# if all parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

=begin

Input = string
Data structure: Iteration/counter
Output = boolean

Algo =
- Iterate through the string.  If a left paren comes up, toggle a counter.
If a right paren comes up, toggle it back.  Return true at the end of the iteration
if the counter is in original position, or return false if counter is toggled

- Initialize a counter variable and assign 0 to it
- Call each_char methon on the string.
- Add one to counter if char equals left paren
- Subtract one to counter if char equals right paren
- Return false if counter ever equals negative one, or if not 0 at end of iteration

=end

def balanced?(str)
  toggle = 0
  str.each_char do |char|
    case
    when char == '('
      toggle += 1
    when char == ')'
      toggle -= 1
      return false if toggle < 0
    end
  end
  toggle == 0
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
