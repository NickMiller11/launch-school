# def remove_vowels(array)
#   new_array = []
#   array.each do |word|
#     new_array << word.tr('aeiou', '')
#   end
#   puts new_array.join(', ')
# end
#
# remove_vowels(['green', 'yellow', 'black', 'white'])

def remove_vowels(array)
  puts array.map { |word| word.tr('aeiou', '') }.join(', ')
end

remove_vowels(['green', 'yellow', 'black', 'white'])
