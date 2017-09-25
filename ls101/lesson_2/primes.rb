require "pry"

def find_primes(num1, num2)
  argu_range_array = (num1..num2).to_a
  primes_array = (num1..num2).to_a
  argu_range_array.each do |value|
    divisor = 2
    loop do
      result = value % divisor
      primes_array.delete(value) if result == 0 unless value == 2
      break if result == 0
      divisor += 1
      break if divisor == value
    end
  end
  p primes_array
end

find_primes(2, 15)
