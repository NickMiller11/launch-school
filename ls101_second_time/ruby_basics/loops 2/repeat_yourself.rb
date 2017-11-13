def repeat(str, i)
  i.times { puts str }
end

def repeat(str, i)
  puts (str + "\n") * i
end

repeat("Hello", 3)
