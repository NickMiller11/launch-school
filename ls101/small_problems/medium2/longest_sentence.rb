
# X remove new lines
# X split by punctuation
# X split again by word
# X iterate through elements and assign longest to variable
# X print variable

# my solution

punctuation = "[!.?]"
my_regex = /#{punctuation}/

file = File.open("pg84.txt", "r")
contents = file.read
contents.tr!("\n", " ")
arr = contents.split(my_regex)

arr2 = arr.map { |sentence| sentence.split(" ")

longest_sentence = []
arr2.each do |sentence|
  longest_sentence = sentence if sentence.length > longest_sentence.length
end

p longest_sentence.length


# LS solution

text = File.read("longest_sentence.txt")
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
