class Transform

  def initialize(string)
    @string = string
  end

  def self.lowercase(words)
    words.downcase
  end

  def uppercase
    @string.upcase
  end

  def to_s
    "#{@string}"
  end
end


# Write a class that will display:

# ABC
# xyz

# when the following code is run:

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
