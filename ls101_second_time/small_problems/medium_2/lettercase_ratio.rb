# In the easy exercises, we worked on a problem where we had to count the number 
# of uppercase and lowercase characters, as well as characters that were neither 
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 
# entries: one represents the percentage of characters in the string that are 
# lowercase letters, one the percentage of characters that are uppercase letters, 
# and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

=begin

Input: string
Output: hash with ratios

Rules: 
- return a has that contains ratios for lowercase, uppercase, and neither characters
- input will not be an empty string

Algorithm:
- initialize a new hash
- incrament ratios by 1 for each character of that type
- divide by size of the array and multiply by 100

=end

def letter_percentages(str)
  return_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  individ_value = (1.0 / str.length) * 100
  arr = str.chars
  arr.each do |char|
    if char =~ /[a-z]/
      return_hash[:lowercase] += individ_value
    elsif char =~ /[A-Z]/
      return_hash[:uppercase] += individ_value
    else
      return_hash[:neither] += individ_value
    end
  end
  return_hash  
end



p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }