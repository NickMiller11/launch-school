# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

=begin

Input: string
Output: hash

Rules:
- return a hash that counts the number of lowercase, uppercase, and neither
  - characters in a string

Algorithm:
- Initialize the hash I'm supposed to return
- Iterate through the string
- add to the hash depending on what type of character it is

=end

def letter_case_count(str)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |char|
    case
    when char =~ /[a-z]/
      hsh[:lowercase] += 1
    when char =~ /[A-Z]/
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
