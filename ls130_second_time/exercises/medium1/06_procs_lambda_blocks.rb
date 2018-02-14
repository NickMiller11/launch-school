# For this exercise, we'll be learning and practicing our knowledge of the arity
# of lambdas, procs, and implicit blocks. Two groups of code also deal with the
# definition of a Proc and a Lambda, and the differences between the two. Run
# each group of code below: For your answer to this exercise, write down your
# observations for each group of code. After writing out those observations,
# write one final analysis that explains the differences between procs, blocks,
# and lambdas.

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')

# gives an argument error --> need to call with the right number of arguments
# my_lambda.call

# gives a name error --> uninitialized constant Lambda
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }


# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}

# gives a Local Jump Error --> no block given
# block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

# gives a NameError --> undefined local variable 'animal'
block_method_2('turtle') { puts "This is a #{animal}."}

=begin

Observations:
Procs can be called without an argument and param will turn into nil
Lambdas are members of Proc class
Lambdas have two styles for writing them out
Lambdas must be called with right number of arguments
Blocks must be given if method yields to it
Blocks can be called without an argument and param will turn into nil.

One line -Procs, Lambdas, and Blocks all allow extra code to be inserted into
a method, but differ in their implementation.

LS One line (two lines actually):
- Lambdas are types of Proc's.  Techically they are both Proc objects.  An
implicit block is a grouping of code, a type of closure, it is not an Object.
- Lambdas enforce the number of arguments passed to them.  Implicit block and
Procs do not enforce the number of arguments passed in.

=end