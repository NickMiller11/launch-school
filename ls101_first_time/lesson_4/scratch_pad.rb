# hsh = {
#   first: ['the', 'quick'], second: ['brown', 'fox'],
#   third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']
# }
#
# vowel = 'aeiou'
#
# hsh.each_value do |array|
#   array.each do |str|
#     str.chars.each do |chars|
#       puts chars if vowel.include?(chars)
#     end
#   end
# end

# ------

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#
# a = arr.map do |subarr|
#   subarr.sort do |a, b|
#     b <=> a
#   end
# end
#
# p a

# ------

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

a = arr.map do |hsh|
  hsh.map do |v|
    v += 1 if v.integer?
  end
end

p a
