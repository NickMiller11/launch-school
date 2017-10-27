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

=end



friday_13th(2015) #== 3
friday_13th(1986) #== 1
friday_13th(2019) #== 2