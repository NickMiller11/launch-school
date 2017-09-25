
# input - positive integer
# output - array with integer digits
# process - take in integer and convert into array


def digits_list1(num)
  a = []
  while num > 0
    digit = num % 10
    a.unshift(digit)
    num = num / 10
  end
  return a
end

p digits_list1(12345)

# wow, that seems like an unnecessarily clumbsy way of doing this...

# LS brute force solution below

def digits_list2(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

p digits_list2(12345)

# actually, this wasn't to far off from my solution.  
# I'm still using While loops that I got used to...while...
# learning Python. I should remember to use loop do instead

# LS idiomatic solution below

def digits_list3(number)
  number.to_s.chars.map(&:to_i)
end

p digits_list3(12345)