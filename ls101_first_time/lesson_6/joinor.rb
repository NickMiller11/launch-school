def joinor(arr, punc=', ', final='or')
  punc = ' ' if arr.size == 2
  arr[-1] = final + ' ' + arr.last.to_s if arr.size > 1
  arr.join(punc)
end

p joinor([1])
p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
