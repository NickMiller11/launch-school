# input - 1 integer (pos, neg, or 0)
# output - true if abs of integer is odd

def is_odd?(num)
  num.abs % 2 != 0
end

puts is_odd?(5)
puts is_odd?(-7)
puts is_odd?(0)
puts is_odd?(1543452)
puts is_odd?(-2346543)
puts is_odd?(1)

def is_odd?(num)
  num.abs.remainder(2) != 0
end

puts is_odd?(5)
puts is_odd?(-7)
puts is_odd?(0)
puts is_odd?(1543452)
puts is_odd?(-2346543)
puts is_odd?(1)