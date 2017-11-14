=begin

m = p * (j / (1 - (1 + j)**(-n)))

    m = monthly payment
    p = loan amount
    j = monthly interest rate
    n = loan duration in months

Input:
  - integer (loan amount)
  - float (APR)
  - integer (loan duration)

Output:
  - float (monthly payment)

Rules:
  - calculate monthly interest rate
  - calculate loan duration in months

Algorithm:
  - welcome user to the mortgage calculator
  - ask for input - loan amount
  - ask for input - APR
  - ask for input - loan duration in years
  - calculate monthly interest rate
    - APR divided by 12
  - calculate loan duration in months
    - loan duration in years multiplied by 12
  - use formula to calculate monthly payment
    - m = p * (j / (1 - (1 + j)**(-n)))
  - print monthly payment to screen
  - ask user if they would like to perform another calculation

=end

def prompt(message)
  puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

loop do
  prompt("Hello and welcome to the mortgage calculator!")

  prompt("I need to first collect three pieces of information from you.")

  prompt("First, what is your loan amount in dollars?")
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    break if number?(loan_amount) && loan_amount.to_i != 0
    prompt("I'm sorry, that doesn't look like a valid number.")
  end

  prompt("Next, what is your annual percentage rate (APR)?")
  apr = ''
  loop do
    apr = gets.chomp
    break if number?(apr) && apr.to_f != 0.0
    prompt("I'm sorry, that doesn't look like a valid number.")
  end

  prompt("Finally, what is your loan duration (in years)?")
  loan_duration_years = ''
  loop do
    loan_duration_years = gets.chomp
    break if number?(loan_duration_years) && loan_duration_years.to_i != 0
    prompt("I'm sorry, that doesn't look like a valid number.")
  end

  monthly_interest_rate = (apr.to_f / 100) / 12
  loan_duration_months = loan_duration_years.to_i * 12
  monthly_payment = loan_amount.to_i * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}")
  prompt("Would you like to perform another calculation?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
