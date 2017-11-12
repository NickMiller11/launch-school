# Bubble Sort is one of the simplest sorting algorithms available.
# It isn't an efficient algorithm, but it's a great exercise for
# student developers. In this exercise, you will write a method that
# does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array.
# On each pass, each pair of consecutive elements is compared. If the first of
# the two elements is greater than the second, then the two elements are swapped.
# This process is repeated until a complete pass is made without performing any
# swaps; at that point, the Array is completely sorted.rations) through the Array.

# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.

=begin

Input: array
Data structure: iteration
Output: array

So I'm definitely going to have to iterate through the array several times.
I'm going to have to loop, and then break only when no changes have been made.

I'm going to need a way to determine if there are no more changes while iterating.
- I could compare the array each time with the array from the last pass.
- I could also use a counter that I increment each time a change happens, then
break if the counter remains zero after the full pass.  Counter is reset each pass

I could also push the items to an intermediate array if mutating the original
array doesn't go as planned

Steps:
Set up a loop
Check arr[0] and arr[1].
If arr[0] is larger, switch with arr[1]
Check arr[1] and arr[2].
....
Break loop if no more changes have been made
Start at beginning again
Return modified array

=end

require "pry"

def bubble_sort!(arr)

  loop do
    counter = 0
    times_bubbled = 0
    loop do
      compare = arr[counter] <=> arr[counter + 1]
      if compare == 1
        arr[counter], arr[counter + 1] = arr[counter + 1], arr[counter]
        times_bubbled += 1
      end
      counter += 1
      break if counter == arr.size - 1
    end
    break if times_bubbled == 0
  end
  arr
end

# Below code does not work

# def bubble_sort!(arr)
#   loop do
#     times_bubbled = 0
#     arr.map!.with_index do |num, i|
#       compare = arr[i] <=> arr[i + 1]
#       if compare == 1
#         times_bubbled += 1
#         arr[i], arr[i + 1] = arr[i + 1], arr[i]
#       else
#         arr[i]
#       end
#     end
#     break if times_bubbled == 0
#   end
#   arr
# end



array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

array = [5, 3]
p bubble_sort!(array)
# array == [3, 5]


array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
