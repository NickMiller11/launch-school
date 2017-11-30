class GoodDog
  attr_accessor :name, :height, :weight
  # attr_reader   :name
  # attr_writer   :name

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  # def get_name
  #   @name
  # end
  #
  # def name
  #   @name
  # end
  #
  # def set_name=(name)
  #   @name = name
  # end
  #
  # def name=(n)
  #   @name = n
  # end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.speak
puts sparky.info
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
