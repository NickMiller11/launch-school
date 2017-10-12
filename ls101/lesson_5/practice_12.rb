arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

a = arr.each_with_object({}) do |el, hsh|
  hsh[el[0]] = el[1]
end

p a
