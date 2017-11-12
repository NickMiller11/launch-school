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

Algo:
- inititialize the final hash
- call each_char method on str.
  - create a case statement and call match? method on each character
    - char  /[a-z]/
      - increment lowercase value by 1
    - char = /[A-Z]/
      - increment uppercase value by 1
    - char = /[^a-z]/i
      - increment non-alphabet value by 1
- use the map method to mutate the hash
  - divide the value by str.length and multiply by 100 to get the percentage

=end

require "pry"

def letter_percentages(str)
  character_count = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = {}
  str.each_char do |char|
    case
    when char.match?(/[a-z]/)
      character_count[:lowercase] += 1
    when char.match?(/[A-Z]/)
      character_count[:uppercase] += 1
    else
      character_count[:neither] += 1
    end
  end
  character_count.each do |k,v|
    percentages[k] = (v.to_f / str.size.to_f * 100)
  end
  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
