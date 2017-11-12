# The time of day can be represented as the number of minutes before
# or after midnight. If the number of minutes is positive,
# the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write a method that takes a time using this minute-based format and
# returns the time of day in 24 hour format (hh:mm). Your method should
# work with any integer input.

# You may not use ruby's Date and Time classes.

# def remove_days(int)
#   loop do
#     break if int < 1440
#     int -= 1440
#   end
#   int
# end
#
# def convert_neg(int)
#   loop do
#     break if int > 0
#     int += 1440
#   end
#   int
# end
#
# def time_of_day(int)
#   time = []
#
#   if int > 1440 # remove any extra days of time
#     int = remove_days(int)
#   end
#
#   if int < 0 # dealing with negative numbers
#     int = convert_neg(int)
#   end
#
#   time << (int / 60).to_s # converting hours
#   time << (int % 60).to_s # converting minutes
#   time.map { |i| i.prepend("0") if i.length == 1 } # adding the extra 0's
#   time.insert(1, ':')
#   time.join('')
# end

MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24
MINUTES_IN_DAY = MINUTES_IN_HOUR * HOURS_IN_DAY

def time_of_day(int)
  int %= MINUTES_IN_DAY
  hours, minutes = int.divmod(MINUTES_IN_HOUR)
  format('%02d:%02d', hours, minutes)
end

# I really like this LS solution.  I should come back to this to ingrain
# this further

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Thoughts:
# Use the divide by 60
# Break the number down bit by bit
# use an array?
