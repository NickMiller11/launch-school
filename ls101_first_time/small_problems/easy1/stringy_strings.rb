def stringy(num, ticker=1)
  arr = Array.new(num, 1)
  arr.map!.with_index do |x, i|
    if ticker == 0
      i.even? ? x = 0 : x
    else
      i.odd? ? x = 0 : x
    end
  end
  arr.join
end

puts stringy(6) # == '101010'
puts stringy(9, 0) # == '101010101'
puts stringy(4, 0) # == '1010'
puts stringy(7, 0) # == '1010101'
