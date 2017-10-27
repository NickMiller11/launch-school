# In the easy exercises, we worked on a problem where we had to count the 
# number of uppercase and lowercase characters, as well as characters that 
# were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 
# entries: one represents the percentage of characters in the string that are 
# lowercase letters, one the percentage of characters that are uppercase 
# letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

=begin

Input: string
Data structure: 

Output: hash

=end



def letter_percentages(str)
  
end

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }