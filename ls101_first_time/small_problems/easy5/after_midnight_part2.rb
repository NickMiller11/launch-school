# As seen in the previous exercise, the time of day can be
# represented as the number of minutes before or after midnight.
# If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format,
# and return the number of minutes before and after midnight, respectively.
# Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24
MINUTES_IN_DAY = MINUTES_IN_HOUR * HOURS_IN_DAY

def after_midnight(str)
  total_minutes = (str[0..1].to_i * MINUTES_IN_HOUR) + str[3..4].to_i
  total_minutes %= MINUTES_IN_DAY
  total_minutes
end

def before_midnight(str)
  total_minutes = MINUTES_IN_DAY - after_midnight(str)
  total_minutes = 0 if total_minutes == MINUTES_IN_DAY
  total_minutes
end

# convert this from a string into two integers
# multiply the first integer by MINUTES_IN_HOUR
# add on the second integer


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
