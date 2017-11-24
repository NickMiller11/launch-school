# Write a method that takes an array of strings, and returns an array
# of the same string values, except with the vowels (a, e, i, o, u) removed.

=begin

Input: string
Output: string

Rules:
- return input string with vowels removed
- vowels are a, e, i, o, u

Algorithm:
- Use Array#map method on the Array
- use gsub! to remove vowels from each word
- return the same array

=end


def remove_vowels(arr)
  arr.map { |word| word.delete('aeiouAEIOU')}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']
