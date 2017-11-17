# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

=begin

Input: integer
Output: boolean

Rules:
- return true if integer is same forward as backwards

Algorithm:
- convert to string and compare with reversed

=end

def palindromic_number?(int)
  int.to_s.reverse == int.to_s
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(050) == true
