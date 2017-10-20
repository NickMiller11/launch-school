
# Input: string
# Data: array, other methods
# Output: string

# validate integers
# define methods for each instruction
# loop through array and perform instructions

require 'pry'

def push(reg, stack)
  stack << reg
end

def mult(reg, stack)
  reg *= stack.pop
end

def print_val(reg)
  puts reg
end

def minilang(input)
  register = 0
  stack = []
  instructions = input.split(' ')
  instructions.each do |val|
    binding.pry
    case 
    when val == val.to_i.to_s
      register = val
    when 'PUSH'
      push(register, stack)
    when 'MULT'
      mult(register, stack)
    when 'PRINT'
      print_val(register)
    end
  end
end

minilang('5 PUSH 3 MULT PRINT')