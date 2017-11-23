# The time of day can be represented as the number of minutes before or
# after midnight. If the number of minutes is positive, the time is after
#  midnight. If the number of minutes is negative, the time is before midnight.
#
# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.
#
# You may not use ruby's Date and Time classes.

=begin

Input: integer
Output: string representing time

Rules:
- return a string representing a time of day at midnight offset by the
  - input integer
- use 24 hour time format
- cannot use Time or Date classes

Algorithm:
- use divmod to determine the hours/minutes offset from midnight
- uses cases to determine flow control for input
  - 0
  - negative
  - positive

=end

def time_of_day(minutes)
  case minutes <=> 0
  when 0
    "00:00"
  when 1
    minutes = minutes % 1440
    hours, minutes = minutes.divmod(60)
    format("%02d", hours) + ":" + format("%02d", minutes)
  when -1
    minutes = 1440 + minutes
    minutes = minutes % 1440
    hours, minutes = minutes.divmod(60)
    format("%02d", hours) + ":" + format("%02d", minutes)
  end
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
