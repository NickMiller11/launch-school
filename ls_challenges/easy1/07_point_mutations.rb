# Write a program that can calculate the Hamming difference between two DNA strands.

# A mutation is simply a mistake that occurs during the creation or copying of a
# nucleic acid, in particular DNA. Because nucleic acids are vital to cellular
# functions, mutations tend to cause a ripple effect throughout the cell.
# Although mutations are technically mistakes, a very rare mutation may equip
# the cell with a beneficial attribute. In fact, the macro effects of evolution
# are attributable by the accumulated result of beneficial microscopic mutations
# over many generations.

# The simplest and most common type of nucleic acid mutation is a point mutation,
# which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken
# from different genomes with a common ancestor, we get a measure of the minimum
# number of point mutations that could have occurred on the evolutionary path
# between the two strands.

# This is called the 'Hamming distance'

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length.
# If you have two sequences of unequal length, you should compute the Hamming
# distance over the shorter length.

=begin

input: string
output: integer

rules:
- count the number of differences between two strands of DNA
- if one string is longer than another, compare over the shorter string length

algorithm:
- put the strings into arrays and zip them together, count the number
  of subarrays where #first != #last

=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    min_size = [@strand.size, distance.size].min

    comparison = @strand[0, min_size].chars.zip(distance[0, min_size].chars)
    comparison.select { |sub_arr| sub_arr.first != sub_arr.last }.count
  end
end

=begin

Notes from the video:

-You can use #each to iterate through indices.
 For example:

 (0..(min_size - 1)).each do |index|
   counter +=1 if @strand[index] != distance[index]
 end

 I supposed you could also do the above with #each_with_index on an array
 and just underbar the char value and just use the index value

- You can use (A...B) to do A up to B but not including B (use three dots)

=end
