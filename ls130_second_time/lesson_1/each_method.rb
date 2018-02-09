def each(array)
  counter = 0
  while counter < array.size do
    current_value = array[counter]
    yield(current_value)
    counter += 1
  end

  array
end

p [1, 2, 3].each { |num| puts num }.select { |num| num.odd? }
