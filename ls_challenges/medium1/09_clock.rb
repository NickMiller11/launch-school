# Create a clock that is independent of date.

# You should be able to add and subtract minutes to it.
# Two clocks that represent the same time should be
# equal to each other.

=begin

input
output

rules

algorithm

=end

require 'pry'

class Clock
  def initialize(h, m)
    @h = h
    @m = m
  end

  def self.at(h=0, m=0)
    Clock.new(h, m)
  end

  def to_s
    binding.pry
    format('%02d:%02d', @h, @m)
  end

  def +(min)
    add_h, add_m = min.divmod(60)
    @h += add_h
    @m += add_m
    binding.pry
  end
end

clock = Clock.at(10) + 3
puts clock