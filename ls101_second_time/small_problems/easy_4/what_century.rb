# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

=begin

Input: Integer
Output: String

Rules:
- take in a year as an Integer
- return a string that gives century with appropriate suffix
- centuries begin in year 01

Algorithm:
- calculate the appropriate century date
- use a case statement to attach the right suffix
- 11 = th
- 12 = th
- 13 = th
- end in 1 = st
- end in 2 = nd
- end in 3 = rd
- else = th
=end

def century(year)
  century, check = year.divmod(100)
  check == 0 ? century : century += 1
  suffix = century % 100
  if suffix ==  11 || suffix == 12 || suffix == 13
    century.to_s + 'th'
  elsif suffix % 10 == 1
    century.to_s + 'st'
  elsif suffix % 10 == 2
    century.to_s + 'nd'
  elsif suffix % 10 == 3
    century.to_s + 'rd'
  else
    century.to_s + 'th'
  end
end

p century(2000) #== '20th'
p century(2001) #== '21st'
p century(1965) #== '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1052) #== '11th'
p century(1127) #== '12th'
p century(11201) #== '113th'
