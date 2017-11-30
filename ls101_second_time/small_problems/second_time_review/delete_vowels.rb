# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

=begin

Input: array (of strings)
Output: array (of strings without vowels)

Rules:
- return the same array as input without vowels

Algorithm:
- initialze a new local variable and set to empty array
- iterate over input array, pushing non-vowel characters to new array
- return new array

=end

def remove_vowels(arr)
  final_arr = []
  arr.each do |str|
    final_arr << str.gsub(/[aeiou]/i, '')
  end
  final_arr
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']
