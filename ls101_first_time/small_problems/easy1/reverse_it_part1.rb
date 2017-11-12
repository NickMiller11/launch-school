require "pry"

def reverse_sentence(string)
  reverse_order = []
  normal_order = string.split()
  mutate_order = string.split()
  normal_order.each do |element|
    reverse_order.push(mutate_order.pop)
  end
  reverse_order.join(' ')
end


puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
