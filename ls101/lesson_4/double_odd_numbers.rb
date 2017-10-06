def double_odd_numbers(my_numbers, multiplier)
  counter = 0

  loop do
    break if counter == my_numbers.size

    my_numbers[counter] *= multiplier if counter.odd?

    counter += 1
  end
  my_numbers
end


nicks_numbers = [5, 15, 25, 35, 45, 999]

p double_odd_numbers(nicks_numbers, 4)

# def double_odd_numbers(my_numbers)
#   counter = 0
#   doubled_numbers = []
#
#   loop do
#     break if counter == my_numbers.size
#     current_number = my_numbers[counter]
#
#     if counter.odd?
#       current_number *= 2
#     end
#
#     doubled_numbers << current_number
#     counter += 1
#   end
#   doubled_numbers
# end

# def double_odd_numbers(my_numbers)
#   counter = 0
#   doubled_numbers = []
#
#   loop do
#     break if counter == my_numbers.size
#
#     if counter.odd?
#       my_numbers[counter] *= 2
#     end
#
#     doubled_numbers << my_numbers[counter]
#     counter += 1
#   end
#   doubled_numbers
# end




# nicks_numbers = [5, 15, 25, 35, 45, 999]
#
# p double_odd_numbers(nicks_numbers)
