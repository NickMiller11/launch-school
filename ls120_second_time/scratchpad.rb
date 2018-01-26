class Person
  def say
    puts "I'm saying " + something
  end

  private

  def something
    "something"
  end
end

nick = Person.new
nick.say
puts nick.something