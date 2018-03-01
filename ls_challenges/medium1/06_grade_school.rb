# Write a small archiving program that stores students' names along with the
# grade that they are in.

# In the end, you should be able to:

# - Add a student's name to the roster for a grade
#   - "Add Jim to grade 2."
#   - "OK."

# - Get a list of all students enrolled in a grade
#   - "Which students are in grade 2?"
#   - "We've only got Jim just now."

# - Get a sorted list of all students in all grades.
# Grades should sort as 1, 2, 3, etc., and students within a
# grade should be sorted alphabetically by name.
#   - "Who all is enrolled in school right now?"
#   - "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe. Grade 3…"

# Note that all our students only have one name.
# (It's a small town, what do you want?)

=begin

Add:
input: string, integer
output: N/A

rules:
- add the name to a sub array where the first element is the same integer(grade)
- if the integer(grade) doesn't exist, create it

algorithm:
- iterate over the school array to find the subarray that includes the grade
  - if it exists, add the name as another element in that sub array
  - if it doesn't exist, add the grade and name as a sub array to the main array


Grade:
- return the name sub array for a particular grade

=end

require 'pry'
class School
  attr_reader :school

  def initialize
    @school = []
  end

  def to_h
    sort!
    @school.to_h
  end

  def add(name, grade)
    grade_exist?(grade) ? grade(grade) << name : @school << [grade, [name]]
  end

  def grade(grade_number)
    return [] unless grade_exist?(grade_number)
    @school.select { |level| level[0] == grade_number}[0][1]
  end

  private

  def grade_exist?(grade)
    @school.any? { |grade_level| grade_level[0] == grade }
  end

  def sort!
    @school.sort!
    @school.each { |grade_level| grade_level[1].sort! }
  end

end
