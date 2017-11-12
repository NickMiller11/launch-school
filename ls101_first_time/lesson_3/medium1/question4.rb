# Alyssa was asked to write an implementation of a rolling buffer.
# Elements are added to the rolling buffer and if the buffer becomes full,
# then new elements that are added will displace the oldest elements in the buffer.
#
# She wrote two implementations saying, "Take your pick. Do you like << or + for
# modifying the buffer?". Is there a difference between the two, other than what
# operator she chose to use to add an element to the buffer?


def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  puts input_array.object_id
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Without running this, I can see that the << will mutate the original input_array
# and preserve the object_id.  Using + and reassigning the variable, however, will
# cause object_id's to change.  Let's run a few tests.

p rolling_buffer1(['a','b','c'], 4, 'd')
p rolling_buffer1(['a','b','c'], 3, 'd')
p rolling_buffer1([1,2,3], 3, 4)
p rolling_buffer1([1,2,3], 3, [5, 6, 7])

p rolling_buffer2(['a','b','c'], 4, 'd')
p rolling_buffer2(['a','b','c'], 3, 'd')
p rolling_buffer2([1,2,3], 3, 4)
p rolling_buffer2([1,2,3], 3, [5, 6, 7])

# Ok, after running the tests, the only difference I can discern is that the
# rolling_buffer1 is using mutation while rolling_buffer2 is using reassignment.

# After checking the solution, I now realize that, while I technically got the
# right answer, I didn't understand the implications of how they relate to what
# a rolling buffer is trying to do.  Specifically, the rolling buffer is trying
# to mutate something passed into it.  The mutating method, rolling_buffer1, will
# do this properly, while rolling_buffer2 will make the changes and assign them
# to a locally-scoped variable, defeating the purpose.
