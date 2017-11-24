# Write a method that takes an Array of Integers between 0 and 19, and
# returns an Array of those Integers sorted based on the English words
# for each number:
#
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

=begin

Input: array of integers between 0 and 19
Output: array of integers sorted based on written english word for each number

Rules
- sort array based on written english word for each number

Algorithm
- create a hash linking number and english word
- use the sort_by method to sort using the english word of that number

=end

ENGLISH_NUMBERS = {
  0=>'zero', 1=>'one', 2=>'two', 3=>'three', 4=>'four',
  5=>'five', 6=>'six'
}

def alphabetic_number_sort(arr)

end

alphabetic_number_sort((0..19).to_a) #== [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
