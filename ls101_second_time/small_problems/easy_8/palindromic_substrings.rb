# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string. Duplicate
# palindromes should be included multiple times.
#
# You may (and should) use the substrings method you wrote in the previous exercise.
#
# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
#   "Abc-bA" are. In addition, assume that single characters are not palindromes.

=begin

Input: string
Output: array of strings

Rules:
- return an array of substrings of the input string that are palindromes
- duplicates can be included multiple times
- palindromes are case-sensitive
- single characters are not palindromes

Algorithm:
- get a final_arr from the substrings and substrings_at_start methods
- iterate through that array and keep_if any palindromes to a new array
=end


def substrings_at_start(str)
  result_arr = []
  0.upto(str.size-1) do |num|
    result_arr << str[0..num]
  end
  result_arr
end

def substrings(str)
  final_arr = []
  counter = 0
  loop do
    final_arr << substrings_at_start(str[counter..-1])
    counter += 1
    break if counter == str.size
  end
  final_arr.flatten
end

def palindromes(str)
  final_arr = substrings(str)
  results = []
  final_arr.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(str)
  str == str.reverse && str.size > 1
end



p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
