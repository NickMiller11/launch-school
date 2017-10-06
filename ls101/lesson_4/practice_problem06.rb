flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |x|
  x.slice(0,3)
end

p flintstones
#
# def first_three_char(names)
#   counter = 0
#
#   loop do
#     break if counter == names.size
#     name = names[counter]
#     name.slice(0,3)
#     counter += 1
#   end
#   names
# end
#
# p first_three_char(flintstones)
