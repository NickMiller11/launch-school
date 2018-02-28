# Lets write a program that will translate RNA sequences into proteins.
# RNA can be broken into three nucleotide sequences called codons, and
# then translated to a polypeptide like so:

# RNA: "AUGUUUUCU" => translates to

# Codons: "AUG", "UUU", "UCU"
# => which become a polypeptide with the following sequence =>

# Protein: "Methionine", "Phenylalanine", "Serine"

# There are 64 codons which in turn correspond to 20 amino acids; however,
# all of the codon sequences and resulting amino acids are not important in
# this exercise.

# There are also four terminating codons (also known as 'STOP' codons); if
# any of these codons are encountered (by the ribosome), all translation ends
# and the protein is terminated. All subsequent codons after are ignored,
# like this:

# RNA: "AUGUUUUCUUAAAUG" =>

# Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

# Protein: "Methionine", "Phenylalanine", "Serine"

# Note the stop codon terminates the translation and the final methionine
# is not translated into the protein sequence.--

# Below are the codons and resulting Amino Acids needed for the exercise.

# Codon	Protein

# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
# UCU, UCC, UCA, UCG	Serine
# UAU, UAC	Tyrosine
# UGU, UGC	Cysteine
# UGG	Tryptophan
# UAA, UAG, UGA	STOP

=begin

input: string
output: string

rules:
- translate the codon into the protein
- stop translating if your reach a STOP codon

algorithm:

=end

require 'pry'

class InvalidCodonError < StandardError; end

class Translation
  CODONS = {
    ['AUG'] => 'Methionine',
    ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine',
    ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_codon(codon)
    key = CODONS.keys.keep_if { |x| x.include?(codon) }.flatten
    CODONS[key]
  end

  def self.of_rna(strand)
    result = []
    arr = strand.chars.each_slice(3).map(&:join)
    arr.each do |codon|
      if of_codon(codon) == "STOP"
        break
      elsif of_codon(codon) == nil
        raise(InvalidCodonError)
      else
        result << of_codon(codon)
      end
    end
    result
  end
end

=begin

Notes from video:
- be careful of using ivar's in class methods (don't do it in general)

- rather than calling methods to generate ivars to be used in class methods,
  just create a local variable and assign it to the return value of those methods

- if you're using #each to explicitly step through a collection, there is usually
  a better way to do what you're trying to do

- use "unless" instead of "if" something == false

- if you use loop, while, for, or each, there is usually a more expressive method
  you can use and use less code/less manual code

- a clearer data structure for the codons would have been 'AUG' => 'Methionine'
  rather than getting clever and putting them in an array

- a good way to do raise the InvalidCodonError is:
  CODONS.fetch(codon) { raise InvalidCodonError }
  Need to use the simple hash structure described above to take advantage of this

- a class is a special module that you can call .new on.  In other words, if you
  never want to call .new, you can just make it a module instead of a class.
  It becomes just a holder of a bag of methods at that point.

- I could easily refactor self.of_rna to use each_with_object instead of each

=end