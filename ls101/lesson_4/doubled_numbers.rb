def doubled_numbers!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end
  numbers
end

p doubled_numbers!([1, 2, 3, 4, 5])
