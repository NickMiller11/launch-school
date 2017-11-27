# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase.

=begin

Input: string
Output: string

Rules:
- return a new string that contains a staggered capitalizatoin scheme
- all non-alphabetic characters are ignored but counted as position for capitalizing

Algorithm:
- first thing that comes to mind is to initialize a local variable and assign to a
  - boolean, that I can then toggle on and off.
- I can initialize a new variable and call String#each_char to iterate through
  - the string, pushing each character to the new string
=end

require "pry"

def staggered_case(str) # moving to new string
  capital_letter = false
  new_str = ''
  str.each_char do |letter|
    capital_letter = !capital_letter
    capital_letter ? letter.upcase! : letter.downcase!
    new_str << letter
  end
  new_str
end

def staggered_case2(str) # modifying original string
  capital_letter = false
  arr = str.split('')

  arr.map! do |letter|
    capital_letter = !capital_letter
    capital_letter ? letter.upcase : letter.downcase
  end

  arr.join('')
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS') == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
