# Write a method that returns the number of Friday the 13ths in the
# year given by an argument. You may assume that the year is greater
# than 1752 (when the United Kingdom adopted the modern Gregorian Calendar)
# and that it will remain in use for the foreseeable future.

=begin

input: integer
data structure:
output: integer

I'm at a loss with how to solve this...

One idea is to use the Time#friday? method combined with a counter to iterate
through the given year and determine if any times that the counter moves through
the 13th day of the month, it would check it it was Friday and add to a different
counter.

Possibly useful time methods:
Time.new(year)
yday # => gives the day of the year
mday # => gives the day of the month
wday # => gives the day of the week

Initialize a new variable and assign it to Time.new(year).
  - This represents Jan 1
Initialize a variable and assign 0 to it
Create a loop
Use the addition operator to add a day (t + (60 * 60 * 24))
Check if it's the 13th
Check if it's Friday
  if so, add to counter
Break if day equals 12.31
Return counter

=end

def friday_13th(year)
  date = Time.new(year)
  counter = 0
  loop do
    date += (60 * 60 * 24)
    if date.mday == 13 && date.friday?
      counter += 1
    end
    break if date.yday == 365
  end
  counter
end

p friday_13th(2015) #== 3
p friday_13th(1986) #== 1
p friday_13th(2019) #== 2
