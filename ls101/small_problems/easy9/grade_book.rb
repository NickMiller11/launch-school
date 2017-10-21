# Write a method that determines the mean (average) of the three scores
# passed to it, and returns the letter value associated with that grade.

def get_grade(grade1, grade2, grade3)
  avg = (grade1 + grade2 + grade3) / 3
  case
  when avg < 60
    'F'
  when avg < 70
    'D'
  when avg < 80
    'C'
  when avg < 90
    'B'
  else
    'A'
  end
end

def get_grade_ls(g1, g2, g3)
  avg = (g1 + g2 + g3) / 3
  case avg
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

p get_grade_ls(95, 90, 93) == "A"
p get_grade_ls(50, 50, 95) == "D"
