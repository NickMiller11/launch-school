=begin

A circular buffer, cyclic buffer or ring buffer is a data structure that uses
a single, fixed-size buffer as if it were connected end-to-end.

A circular buffer first starts empty and of some predefined length. For example,
 this is an empty 7-element buffer:

[ ][ ][ ][ ][ ][ ][ ]
Assume that a 1 is written into the middle of the buffer (exact starting
  location does not matter in a circular buffer):

[ ][ ][ ][1][ ][ ][ ]
Then assume that two more elements are added, or written to the buffer — 2 & 3
— which get appended after the 1:

[ ][ ][ ][1][2][3][ ]
If two elements are then read, or removed from the buffer, the oldest values
inside the buffer are removed. The two elements removed, in this case, are
  1 & 2, leaving the buffer with just a 3:

[ ][ ][ ][ ][ ][3][ ]
If the buffer has 7 elements then it is completely full:

[6][7][8][9][3][4][5]
When the buffer is full an error will be raised, alerting the client that
further writes are blocked until a slot becomes free.

The client can opt to overwrite the oldest data with a forced write. In this
case, two more elements — A & B — are added and they overwrite the 3 & 4:

[6][7][8][9][A][B][5]
Finally, if two elements are now removed then what would be returned is not
3 & 4 but 5 & 6 because A & B overwrote the 3 & the 4 yielding the buffer with:

[ ][7][8][9][A][B][ ]

READ
input: N/A
output: object from buffer

rules:
- raise an exception if buffer is empty
- remove and return oldest element from buffer

algorithm:


=end



class CircularBuffer

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = Array.new(size)
  end

  def read
    raise BufferEmptyException unless @buffer.any?
    @buffer.push(nil)
           .shift
  end

  def write(obj)
    raise BufferFullException unless @buffer.include?(nil)
    nil_index = @buffer.index(nil)
    @buffer[nil_index] = obj
  end

  def write!(obj)
    if obj == nil
      return
    elsif @buffer.any? { |x| x == nil }
      write(obj)
    else
      @buffer[0] = obj
      @buffer << @buffer.shift
    end
  end

  def clear
    @buffer.map! { |x| x = nil }
  end
end

=begin

Notes on video:

- seems like I made a crawling buffer, not a circular buffer. Not sure I
  fully understand the difference...I guess the circular buffer tracks the
  index of the oldest read and write objects so you can just replace/remove
  with a new object rather than actually removing/adding objects to the array
  Seems like the top solutions on the challenge site are also crawling buffers,
  so I guess they're not paying that close attention to the difference

- don't forget that sometimes array methods allow you to pass in a block
  For example - @buffer.delete(@buffer[0]) { fail BufferEmptyException }



=end
