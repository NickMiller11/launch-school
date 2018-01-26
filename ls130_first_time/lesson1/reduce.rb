def reduce(array, total=0)
  array.each { |el| total = yield(total, el) }
  total
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
# => 15
p reduce(array, 10) { |acc, num| acc + num }
# => 25
p reduce(array) { |acc, num| acc + num if num.odd? }
# => NoMethodError: undefined method `+' for nil:NilClass