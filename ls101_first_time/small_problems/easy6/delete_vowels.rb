# Write a method that takes an array of strings, and
# returns an array of the same string values, except
# with the vowels (a, e, i, o, u) removed.


# well, I can create a constant named VOWELS.  Then I can use the delete
# method to delete any characters included in VOWELS

# INPUT = array
# Data =
# Output = array

VOWELS = "aeiouAEIOU"

def remove_vowels(arr)
  arr.map! do |str|
    str.delete VOWELS
  end
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
