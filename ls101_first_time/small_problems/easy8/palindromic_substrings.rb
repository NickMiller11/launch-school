# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string. Duplicate
# palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay
#  attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

# def palindromes(str)
#   final_arr = []
#   counter = 0
#   times = str.length
#   loop do
#     1.upto(times) do |count|
#       if str.slice(counter,count) == str.slice(counter,count).reverse &&
#         str.slice(counter,count).size > 1
#         final_arr << str.slice(counter,count)
#       end
#     end
#     counter += 1
#     times -= 1
#     break if counter == str.length
#   end
#   final_arr
# end

def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(str)
  results = []
  (0..str.size).each do |start_index|
    this_substring = str[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end

def palindromes(str)
  final_arr = substrings(str)
  final_arr.keep_if { |v| v.size > 1 && v == v.reverse }
  final_arr
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

# I think this can either be done relatively simply using the LS solution
# for the previous
