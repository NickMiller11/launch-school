def command_line(string)
  puts("==> " + string)
end

command_line("Enter the 1st number:")
first_num = Kernel.gets().chomp().to_i
command_line("Enter the 2nd number:")
second_num = Kernel.gets().chomp().to_i
command_line("Enter the 3rd number:")
third_num = Kernel.gets().chomp().to_i
command_line("Enter the 4th number:")
fourth_num = Kernel.gets().chomp().to_i
command_line("Enter the 5th number:")
fifth_num = Kernel.gets().chomp().to_i
command_line("Enter the last number:")
last_num = Kernel.gets().chomp().to_i

arr = [first_num, second_num, third_num, fourth_num, fifth_num]
if arr.include?(last_num)
  command_line("The number #{last_num} appears in #{arr}")
else
  command_line("The number #{last_num} does not appear in #{arr}")
end
