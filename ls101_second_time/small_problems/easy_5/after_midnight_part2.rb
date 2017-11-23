# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.
#
# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.
#
# You may not use ruby's Date and Time methods.

=begin

Input: string representing time
Output: minutes before and after midnight

Rules:
- compare time represented by input string and midnight.
- return number of minutes between input string and midnight, both before and after
- cannot use Date or Time classes

Algorithm:
- parse the input string to get hours and minutes
- calculate total minutes
- use modulo 1440 on the total minutes
- for after midnight, multiply hours by 60 and add to minutes to get total minutes
- for before midnight, subtract 1440 by total minutes

=end

def after_midnight(time)
  hours = time[0, 2].to_i
  minutes = time[3, 2].to_i
  total_minutes = (hours * 60 + minutes) % 1440
end

def before_midnight(time)
  hours = time[0, 2].to_i
  minutes = time[3, 2].to_i
  total_minutes = (hours * 60 + minutes) % 1440
  if total_minutes == 0
    total_minutes
  else
    1440 - total_minutes
  end
end

p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34') #== 686
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0
