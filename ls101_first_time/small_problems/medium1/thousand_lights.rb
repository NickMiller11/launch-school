# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# You go back to the beginning, and on this second pass, you toggle
# switches 2, 4, 6, and so on. On the third pass, you go back again
# to the beginning and toggle switches 3, 6, 9, and so on. You repeat
# this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.
# The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

require "pry"

def initialize_lights(number)
  Array.new(number + 1, false)
end

def thousand_lights(switch_qty)
  lights = initialize_lights(switch_qty)
  counter = 1
  final_lights = []
  loop do
    break if counter == switch_qty + 1
    lights.map!.with_index do |num, i|
      i % counter == 0 ? !num : num
    end
    # binding.pry
    counter += 1
  end
  final_lights = lights.map! { |boo| lights.index(boo) if boo == true }
  final_lights.shift if final_lights[0] != nil
  final_lights.compact
end


# input: integer
# data structure: array
# output: array

p thousand_lights(5)
p thousand_lights(10)
p thousand_lights(1000)

# input: integer
# data structure: hash with boolean
# output: array

# def initialize_lights(number)
#   (1..number).each_with_object({}) { |num, hash| hash[num] = false }
# end
#
# def toggle_lights(lights, number, round)
#   new_state = {}
#   lights.each do |bulb, state|
#     # binding.pry
#     bulb % round == 0 ? new_state[bulb] = true : new_state[bulb] = false
#   end
#   new_state
# end
#
# def thousand_lights(switch_qty)
#   lights = initialize_lights(switch_qty)
#   1.upto(switch_qty) do |round|
#     toggle_lights(lights, switch_qty, round)
#   end
# end
