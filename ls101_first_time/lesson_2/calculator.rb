
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt(messages('hello', LANGUAGE) + "#{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first_num', LANGUAGE))
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(messages('not_valid', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_num', LANGUAGE))
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(messages('not_valid', LANGUAGE))
    end
  end

  prompt(messages('operator_prompt', LANGUAGE))

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('right_op', LANGUAGE))
    end
  end

  prompt("#{operation_to_message(operator)}" + messages('running_op', LANGUAGE))

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt(messages('return_result', LANGUAGE) + result.to_s) 
  prompt(messages('another_calc', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thank_you', LANGUAGE))
