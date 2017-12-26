# 1. Given the below usage of the Person class, code the class definition.

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new('bob')
# puts bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'

# 2. Modify the class definition from above to facilitate the following methods. 
# Note that there is no name= setter method now.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size == 1 ? '' : parts.last
#   end
  
#   def name
#     "#{@first_name} #{@last_name}"
#   end
# end

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# puts bob.last_name             # => ''
# bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

# 3. Now create a smart name= method that can take just a first name or 
# a full name, and knows how to set the first_name and last_name appropriately.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     split_names(full_name)
#   end
  
#   def name
#     "#{@first_name} #{@last_name}"
#   end
  
#   def name=(full_name)
#     split_names(full_name)
#   end
  
#   private
  
#   def split_names(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size == 1 ? '' : parts.last
#   end
# end

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# puts bob.last_name             # => ''
# bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# puts bob.first_name            # => 'John'
# puts bob.last_name             # => 'Adams'

# 4 Using the class definition from step #3, let's create a few more people -- 
# that is, Person objects. If we're trying to determine whether the two objects 
# contain the same name, how can we compare the two objects?

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     split_names(full_name)
#   end
  
#   def name
#     "#{@first_name} #{@last_name}"
#   end
  
#   def name=(full_name)
#     split_names(full_name)
#   end
  
#   private
  
#   def split_names(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size == 1 ? '' : parts.last
#   end
  
#   protected
  
#   def compare(other)
#     self.name == other.name
#   end
  
# end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# 5 Continuing with our Person class definition, what does the below print out?
# Let's add a to_s method to the class:

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    split_names(full_name)
  end
  
  def name
    "#{@first_name} #{@last_name}"
  end
  
  def name=(full_name)
    split_names(full_name)
  end
  
  def to_s
    name
  end
  
  private
  
  def split_names(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size == 1 ? '' : parts.last
  end
  
  protected
  
  def compare(other)
    self.name == other.name
  end
  
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
