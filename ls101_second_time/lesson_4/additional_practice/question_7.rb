# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

hsh = {}
statement.chars.each do |letter|
  if hsh.keys.include?(letter)
    hsh[letter] += 1
  else
    hsh[letter] = 1
  end
end
puts hsh

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
