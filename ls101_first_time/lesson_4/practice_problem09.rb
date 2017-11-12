words = "the flintstones rock"

def titleize(string)
  arr = string.split(' ')
  arr.each { |x| x.capitalize! }
  arr.join(' ')
end

p titleize(words)
