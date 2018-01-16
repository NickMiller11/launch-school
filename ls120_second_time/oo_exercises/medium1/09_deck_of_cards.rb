=begin

Using the Card class from the previous exercise, create a Deck class that
contains all of the standard 52 playing cards.
Use the following code to start your work:

=end

require 'pry'

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    create_deck
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end

  private

  def create_deck
    # RANKS.each do |rank|
    #   SUITS.each do |suit|
    #     @cards << Card.new(rank, suit)
    #   end
    # end
    @cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    shuffle!
  end

  def shuffle!
    @cards.shuffle!
  end

  def reset
    create_deck
  end

end

class Card
  include Comparable

  attr_reader :rank, :suit

  VALUES = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(@rank, @rank)
  end

  def <=>(other)
    value <=> other.value
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.