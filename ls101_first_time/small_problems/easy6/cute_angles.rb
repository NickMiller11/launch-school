# Write a method that takes a floating point number that represents an
# angle between 0 and 360 degrees and returns a String that represents
# that angle in degrees, minutes and seconds. You should use a degree
# symbol (°) to represent degrees, a single quote (') to represent minutes,
# and a double quote (") to represent seconds. A degree has 60 minutes,
# while a minute has 60 seconds.

def dms(float)
  degrees = float.to_i
  minutes_remainder = (float - degrees) * 60
  minutes = format('%02d', minutes_remainder.to_i)
  seconds_remainder = ((minutes_remainder - minutes_remainder.to_i) * 60)
  seconds = format('%02d', seconds_remainder.to_i)
  answer = %(#{degrees}°#{minutes}'#{seconds}")
  answer
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
