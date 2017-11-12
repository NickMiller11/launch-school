# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01.
# So, the years 1901-2000 comprise the 20th century.

def century(year)
  if year % 100 == 0
    century = year / 100
  else
    century = year / 100 + 1
  end
  century_str = century.to_s

  if century % 100 == 11 || century % 100 == 12 || century % 100 == 13
    ending = 'th'
  elsif century % 10 == 1
    ending = 'st'
  elsif century % 10 == 2
    ending = 'nd'
  elsif century % 10 == 3
    ending = 'rd'
  else
    ending = 'th'
  end
  century_str + ending
end

# should split this into two methods

p century(2000)  == '20th'
p century(2001)  == '21st'
p century(1965)  == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
