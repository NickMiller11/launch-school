# Write a method that takes a string as an argument and returns a
# new string in which every uppercase letter is replaced by its
# lowercase version, and every lowercase letter by its uppercase version.
# All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

require 'pry'

def swapcase(str)
  swapped_case = ''
  str.each_char do |letter|
    if letter == letter.upcase
      swapped_case << letter.downcase
    else
      swapped_case << letter.upcase
    end
  end
  swapped_case
end

p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'
