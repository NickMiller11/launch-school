=begin

Input: string, array
Output: array

Rules:
- return a list of items in same order with sequential duplicates removed

Algo:
- create a new array
- use each with index to push item to new array if object at i - 1 doesn't
  - equal object at i

=end

require 'pry'

def unique_in_order(iterable)
  new_arr = []
  iterable = iterable.split('') if iterable.is_a?(Array) == false
  iterable.each_with_index do |el, idx|
    if idx == 0
      new_arr << el
    elsif iterable[idx] != iterable[idx - 1]
      new_arr << el
    end
    # binding.pry
  end
  new_arr
end


p unique_in_order('AAAABBBCCDAABBB') #== ['A', 'B', 'C', 'D', 'A', 'B']
p unique_in_order('ABBCcAD')         #== ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1,2,2,3,3])       #== [1,2,3]