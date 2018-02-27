=begin

'redder' are palindromes, but 'motor' is not

wire a method that can determine if a given string is a palindrome
- ignore non letters, for example "no1, 3on" is considered a palindrome
- case insensitive
- can't use the 'reverse' method
- can't use regex

input: string
output: boolean

rules:
- ignore non letters, for example "no1, 3on" is considered a palindrome
- case insensitive
- can't use the 'reverse' method
- can't use regex

algorithm:
- downcase everything
- break up string into an array
- delete any non-letter characters (#keep_if)
- build a reverse method
- check if string is same forward and backwards


=end

def custom_reverse(array)
  result = []
  counter = 0
  until counter == array.size do
    result.unshift(array[counter])
    counter += 1
  end
  result
end

def palindrome?(string)
  arr = string.downcase.chars
  arr.select! { |char| ('a'..'z').include?(char) }
  arr == custom_reverse(arr)
end

p palindrome?('redder') == true
p palindrome?('motor') == false
p palindrome?('no1, 3on') == true
p palindrome?('AbccbA') == true
p palindrome?('ABcBc') == false
p palindrome?('') == true
p palindrome?('a') == true
