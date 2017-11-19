# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin
This will return the array [1, nil, nil] because puts returns nil for all numbers
in the colletion greater than 1
=end
