# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.
#
# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
#
# Tested values are all between 0 and 100. There is no need to check for negative
# values or values greater than 100.

=begin

Input: 3 integers
Output: string

Rules:
- return letter grade corresponding to average of three input integers

Algorithm:
- calculate average of grades
- case statement

=end

def get_grade(num1, num2, num3)
  avg = (num1 + num2 + num3) / 3
  case
  when avg >= 90
    'A'
  when avg >= 80
    'B'
  when avg >= 70
    'C'
  when avg >= 60
    'D'
  else
    'F'
  end
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
