# Build a program that displays when the user will
# retire and how many years she has to work till retirement.

puts("What is your age?")
current_age = Kernel.gets().chomp().to_i

puts("At what age would you like to retire?")
retire_age = Kernel.gets().chomp().to_i

age_difference = retire_age - current_age
year = Time.now.year

puts("It's #{year}.  You will retire in #{year + age_difference}.
You have only #{age_difference} years of work to go!")
