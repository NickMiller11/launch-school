# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # this will utilize the class method to print "ByeBye"
puts thing.dupdata # this will utilize the instance method to print "HelloHello"
