
def prompt(message)
  Kernel.puts("=> #{message}")
end

def rm_special_char(num)
  num = num.tr('$%,','')
end

def invalid_int?(num)
  num.empty?() || num.to_i() <= 0
end

def invalid_float?(num)
  num.empty?() || num.to_f() <= 0
end

prompt("Welcome to the Mortgage Calculator!  Please enter your name: ")

user_name = ''
loop do
  user_name = gets().chomp()
  if user_name.empty?
    prompt("Seriously though, what's your name?")
  else
    break
  end
end

prompt("Hi, #{user_name}! Let's get started...")

loop do
  loan_amt = ''
  loop do
    prompt("What is your loan amount (in dollars)?")
    loan_amt = gets().chomp()
    loan_amt = rm_special_char(loan_amt)
    if invalid_float?(loan_amt)
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  apr = ''
  loop do
    prompt("What is your Annual Percentage Rate (APR)?" \
            " For example, 2.5\% or 4.3%.")
    apr = gets().chomp()
    apr = rm_special_char(apr)
    if invalid_float?(apr)
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  loan_dur_yr = ''
  loop do
    prompt("What is the duration of your loan (in years)?")
    loan_dur_yr = gets().chomp()
    loan_dur_yr = rm_special_char(loan_dur_yr)
    if invalid_int?(loan_dur_yr)
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  monthly_int = (apr.to_f() / 100) / 12
  loan_dur_mo = (loan_dur_yr.to_i() * 12)

  monthly_pay = loan_amt.to_f() * ( monthly_int / (1 - (1 + 
                monthly_int)**-loan_dur_mo))

  prompt("Your monthly payment works out to be $#{monthly_pay.round(2)} per month.")

  prompt("Would you like to calculate another mortgage? Press Y if Yes.")
  answer = gets().chomp()
  break unless answer.downcase() == 'y'
end

prompt("Thank you for using the Mortgage Calculator!")
