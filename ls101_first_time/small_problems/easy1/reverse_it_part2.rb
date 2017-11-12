require "pry"
#
# def reverse_words(string)
#   arr = string.split()
#   arr.select { |element| element.reverse! if element.length >= 5 }
#   arr.join(' ')
# end


def reverse_words(string)
  string.split.select { |element| element.reverse! if element.length >= 5 }.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
