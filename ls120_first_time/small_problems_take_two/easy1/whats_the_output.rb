# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# What output does this code print? Fix this class so that there are no
# surprises waiting in store for the unsuspecting developer.

# ----

# Line 18 will print "Fluffy"
# Line 19 will print "My name is FLUFFY."
# Line 20 will print "FLUFFY"
# Line 21 will print "FLUFFY"
