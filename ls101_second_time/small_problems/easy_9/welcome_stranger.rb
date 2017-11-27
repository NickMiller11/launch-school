# Create a method that takes 2 arguments, an array and a hash.
# The array will contain 2 or more elements that, when combined
# with adjoining spaces, will produce a person's name. The hash
# will contain two keys, :title and :occupation, and the appropriate
# values. Your method should return a greeting that uses the person's
# full name, and mentions the person's title.

=begin

Input: array, hash
Output: string

Rules:
- return a string that uses data from array and hash

Algorithm:
- initialize a local variable and assign it to the array.join(' ')
- use string interpolation to reference the name, as well as data in the hash

=end

def greetings(name, info)
  full_name = name.join(' ')
  puts "Hello, #{full_name}! Nice to have a #{info[:title]} #{info[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
