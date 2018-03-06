
=begin

input:
output:

rules:
- use 3 enumerator methods
- print the first 7 factorials using an external iterator
  - once done, reset the enumerator
  - repreint the same 7 factorials using enumerator object as internal iterator

algorithm:

=end

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end