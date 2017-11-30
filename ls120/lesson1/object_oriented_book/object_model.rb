module Testing
  def do_something(input)
    puts "I've done something, specifically #{input}"
  end
end

class MyClass
  include Testing
end

my_obj = MyClass.new

my_obj.do_something("create a module and class.")

puts MyClass.ancestors
