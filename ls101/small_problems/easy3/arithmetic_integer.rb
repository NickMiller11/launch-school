# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those
# two numbers: addition, subtraction, product, quotient, remainder,
# and power. Do not worry about validating the input.

def command_line(string)
  puts("==> " + string)
end

def arithmetic
  command_line("Enter the first number:")
  first_num = Kernel.gets().chomp().to_i
  command_line("Enter the second number:")
  second_num = Kernel.gets().chomp().to_i

  command_line("#{first_num}" " + " "#{second_num}" " = " "#{first_num + second_num}")
  command_line("#{first_num}" " - " "#{second_num}" " = " "#{first_num - second_num}")
  command_line("#{first_num}" " * " "#{second_num}" " = " "#{first_num * second_num}")
  command_line("#{first_num}" " / " "#{second_num}" " = " "#{first_num / second_num}")
  command_line("#{first_num}" " % " "#{second_num}" " = " "#{first_num % second_num}")
  command_line("#{first_num}" " ** " "#{second_num}" " = " "#{first_num ** second_num}")
end

arithmetic
