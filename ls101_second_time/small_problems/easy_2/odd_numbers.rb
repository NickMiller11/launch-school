# Print all odd numbers from 1 to 99, inclusive. 
# All numbers should be printed on separate lines.

# (0..99).each { |num| puts num if num.odd? }

arr = []
(0..99).select { |num| arr << num if num.odd? }
puts arr