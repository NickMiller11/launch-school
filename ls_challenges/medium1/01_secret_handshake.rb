# Write a program that will take a decimal number, and convert it to the
# appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary,
# and those who don't. You and your fellow cohort of those in the "know"
# when it comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret handshake.

=begin

input: integer (base 10)
output: array of strings

rules:
- return an array of strings based on converting a number to binary and parsing
- reverse operations if number is 10000
- invalid input returns empty array

algorithm:
- call #to_i on input to convert to integer
- call #to_s(2) to convert to binary number
- split the binary into an array
- map with a case statement?

=end

require 'pry'

class SecretHandshake
  HANDSHAKE_ACTIONS = ["reverse", "jump", "close your eyes", "double blink", "wink"]

  def initialize(int)
    @int = int.to_i.to_s(2)
  end

  def commands
    arr = prepare_array
    index = 0
    loop do
      arr[index] = HANDSHAKE_ACTIONS[index] if arr[index] == "1"
      index += 1
      break if index == arr.size
    end

    arr.delete("0")
    unless arr.include?("reverse")
      arr.reverse!
    end
    arr.delete("reverse")

    arr
  end

  private

  def prepare_array
    arr = @int.split('')
    until arr.size == 5
      arr.unshift("0")
    end
    arr
  end

end

handshake = SecretHandshake.new(3)
p handshake.commands