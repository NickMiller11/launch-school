# Using the each method, write some code to output
# all of the vowels from the strings.

hsh = {
  first: ['the', 'quick'], second: ['brown', 'fox'],
  third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']
}

vowels = 'aeiou'

hsh.each_value do |arr|
  arr.each do |str|
    str.chars.each do |moji|
      puts moji if vowels.include?(moji)
    end
  end
end
