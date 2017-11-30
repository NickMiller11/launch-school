# The time of day can be represented as the number of minutes before or
# after midnight. If the number of minutes is positive, the time is after
# midnight. If the number of minutes is negative, the time is before midnight.
#
# Write a method that takes a time using this minute-based format and
# returns the time of day in 24 hour format (hh:mm). Your method should
# work with any integer input.
#
# You may not use ruby's Date and Time classes.

=begin

Input: integer (number of minutes)
Output: string (time)

Rules:
- return the time plus or minus the input minutes from midnight
- time is 24 hour format
- format should be hh:mm
- cannot use Date or Time classes

Algorithm:
- first, account for any day differences by using modulo 1440
- next, divmod the input string to get hours and minutes
- add or subtract from midnight as necessary
- use the format method to format the output correctly

=end

def time_of_day(minutes)
  minutes = minutes % 1440
  hours, minutes = minutes.divmod(60)

  if hours < 0
    hours = 24 - hours
    minutes = 60 - minutes
  end

  format('%02d:''%02d', hours, minutes)
end


p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"
