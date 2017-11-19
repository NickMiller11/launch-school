# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
p arr.take(2)

=begin
We can check Ruby docs.  This is non-destructive and returns a new array
containing the first n items of the caller of the take method.
=end
