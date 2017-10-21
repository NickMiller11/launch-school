
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

def add(reg, stack)
  reg + stack.pop
end

def mult(reg, stack)
  reg * stack.pop
end

def div(reg, stack)
  reg / stack.pop
end

def pop(reg, stack)
  stack.pop
end

def print_val(reg)
  puts reg
end

def minilang(input)
  register = 0
  stack = []
  instructions = input.split(' ')
  instructions.each do |val|
    # binding.pry
    case
    when val == val.to_i.to_s
      register = val.to_i
    when val == 'PUSH'
      push(register, stack)
    when val == 'ADD'
     register = add(register, stack)
    when val == 'MULT'
      register = mult(register, stack)
    when val == 'DIV'
      register = div(register, stack)
    when val == 'POP'
      register = pop(register, stack)
    when val == 'PRINT'
      print_val(register)
    end
  end
end

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')