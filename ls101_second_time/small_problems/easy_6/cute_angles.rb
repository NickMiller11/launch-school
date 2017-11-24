# Write a method that takes a floating point number that represents an
# angle between 0 and 360 degrees and returns a String that represents
# that angle in degrees, minutes and seconds. You should use a degree symbol
# (°) to represent degrees, a single quote (') to represent minutes, and a
# double quote (") to represent seconds. A degree has 60 minutes, while a
# minute has 60 seconds.

=begin

Input: integer or float
Output: string

Rules:
- return string that represent angle in degrees, minutes, seconds
- use symbols to designate three categories
- degree has 60 minutes
- minute has 60 sectons

Algorithm:
  use format to get numbers to show correctly
  create a new string variable to include all numbers
  include number logic to break decimals down to minutes and seconds

  - initialize new local variable for string
  - initialize new local variables for degrees, minutes, seconds
  - parse number separating whole numbers from decimals
  - add whole number to degrees with degrees sign
  - calculate minutes and seconds and add to those numbers respectively
  - format numbers and collect them into the string variable

=end

require "pry"

def dms(num)

  degrees = num.to_i
  decimals = (num % 1).round(2)
  minutes = (decimals * 60).to_i
  seconds = ((decimals * 60) % 1 * 60).to_i
  minutes = format('%02d', minutes)
  seconds = format('%02d', seconds)
  final_string = %(#{degrees}°#{minutes}'#{seconds}")
  final_string
end

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(num)
  total_seconds = num * SECONDS_PER_DEGREE
  total_minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = total_minutes.divmod(MINUTES_PER_DEGREE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"),minutes, seconds)
end



p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
