# Write a method that takes a string as an argument and returns a new
# string in which every uppercase letter is replaced by its lowercase
# version, and every lowercase letter by its uppercase version. All other
# characters should be unchanged.
#
# You may not use String#swapcase; write your own version of this method.

=begin

Input: string
Output: string

Rules:
- return a string with the case of each letter of the input string swapped
- no swap for non-alphabetic characters
- cannot use String#swapcase

Algorithm:
- use a case and regex

=end

def swapcase(str)
  new_str = ''
  str.each_char do |char|
    case
    when char =~ /[a-z]/
      new_str << char.upcase
    when char =~ /[A-Z]/
      new_str << char.downcase
    else
      new_str << char
    end
  end
  new_str
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
