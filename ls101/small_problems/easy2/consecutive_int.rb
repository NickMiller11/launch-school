
def command_line(string)
  puts(">> " + "#{string}")
end

def validate_int(num)
  num == num.to_i.to_s && num.to_i > 0
end


def sum_or_product
  # get and validate integer
  int = 0
  loop do
    command_line("Please enter an integer greater than 0:")
    int = Kernel.gets().chomp()
    if validate_int(int) == true
      break
    end
  end

  # get and validate operation variable

  operation = ''
  loop do
    command_line("Enter 's' to compute the sum, 'p' to compute the product")
    operation = Kernel.gets().chomp().downcase
    if operation == 's' || operation == 'p'
      break
    end
  end

  # summation code
  int_i = int.to_i
  if operation == 's'
    total = 0
    loop do
      break if int_i == 0
      total += int_i
      int_i -= 1
    end
    puts("The sum of integers between 1 and #{int} is #{total}")
  end

  # product code
  if operation == 'p'
    total = 1
    loop do
      break if int_i == 0
      total *= int_i
      int_i -= 1
    end
    puts("The product of integers between 1 and #{int} is #{total}")
  end
end

sum_or_product
