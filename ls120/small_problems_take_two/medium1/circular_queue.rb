# A circular queue is a collection of objects stored in a buffer that
# is treated as though it is connected end-to-end in a circle. When an
# object is added to this circular queue, it is added to the position
# that immediately follows the most recently added object, while removing
# an object always removes the object that has been in the queue the longest.
#
# This works as long as there are empty spots in the buffer. If the buffer
# becomes full, adding a new object to the queue requires getting rid
# of an existing object; with a circular queue, the object that has been
# in the queue the longest is discarded and replaced by the new object.
#
#
# Your task is to write a CircularQueue class that implements a circular
# queue for arbitrary objects. The class should obtain the buffer size
# with an argument provided to CircularQueue::new, and should provide
# the following methods:
#
# enqueue to add an object to the queue
#
# dequeue to remove (and return) the oldest object in the queue. It
# should return nil if the queue is empty.
#
# You may assume that none of the values stored in the queue are nil
# (however, nil may be used to designate empty spots in the buffer).
#
# Examples:

=begin

Input: Integers
Output: Integers

Rules:
- use enqueue to add an element to the buffer
- if adding an element to the buffer makes the buffer more than 3 items, replace
  - oldest element
- use dequeue to remove oldest element from the buffer
- return nil if trying to dequeue from empty buffer

Algorithm:
- Enqueue
  - push elements onto the array
  - use max 3 method to check array size
  
- Dequeue
  - return nil if array is empty
  - use shift to remove oldest item (index 0)
  
  
- Max 3 check
  - check to make sure array size is not more than 3.  
  - if it is, delete and return the oldest value (index 0)

=end

require 'pry'

class CircularQueue

  def initialize(size)
    @arr = Array.new
    @size = size
  end

  def enqueue(var)
    @arr.push(var)
    max_three
    # binding.pry
  end

  def dequeue
    return nil if @arr.empty?
    @arr.shift
    # binding.pry
  end
  
  private
  
  def max_three
    @arr.shift if @arr.size > @size
  end
end


queue = CircularQueue.new(3)
queue.dequeue

queue.enqueue(1)
queue.enqueue(2)
queue.dequeue

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# The above code should display true 15 times.
