# Write a program that can generate the lyrics of the 99 bottle bear song.

=begin

input: integer
output: string

rules:
- output the beer song verse when an integer is passed into the 'verse' method
- output verses between int 1 and int 2 when verses method is called
- output the entire beer song when lyrics is called

algorithm:
- need to have unique outputs for verses 2, 1, 0



=end

class BeerSong
  def verse(verse_number)
    case verse_number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_number - 1} bottles of beer on the wall.\n" \
    end
  end

  def verses(start_verse, end_verse)
    result = []
    start_verse.downto(end_verse) do |verse_number|
      result << verse(verse_number)
    end
    result.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

=begin

Notes from video:

Regarding the bonus -

hide inconsistency behind:
- methods
- lamdas (procs)
- classes

Methods:

lookup table
def initialize
  @verse_lookup = Hash.new(:verse_main).merge{ 0 => :verse_0, 1 => :verse_1, 2 => :verse_2 }
end

def verse(number)
  method = @verse_lookup(number)
  result = send(method)
  return result
end

def verse_main
end

def verse_2
end

def verse_1
end

def verse_0
end

Lambdas: (I don't fully understand this...)

def new
  @verse_lookup =
  { 0 => lambda {"..."},
    1 => lambda {"..."},
    2 => lambda {"..."},
    3..99: lambda {|number| " #{number}...#{number-1}"
  }
end

Classes:

=end