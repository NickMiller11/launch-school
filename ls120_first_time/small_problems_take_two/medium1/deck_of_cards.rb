# Using the Card class from the previous exercise, create a Deck class that
# contains all of the standard 52 playing cards. Use the following code to
# start your work:

=begin
  - create draw method
  - make it so new deck is redrawn if out of cards
=end

require 'pry'

# class Deck # initial attempt
#
#   include Comparable
#
#   RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze
#
#   def initialize
#     @in_deck = RANKS.product(SUITS)
#   end
#
#   def rank
#     self.first
#   end
#
#   def suit
#     self.last
#   end
#
#   def draw
#     card = @in_deck.sample
#     @in_deck.delete(card)
#   end
#
# end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

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

  def <=>(other_card)
    value <=> other_card.value
  end
end

# The Deck class should provide a #draw method to draw one card at random.
# If the deck runs out of cards, the deck should reset itself by generating
# a new set of 52 cards.
#
# Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
# binding.pry
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

# Note that the last line should almost always be true; if you shuffle
# the deck 1000 times a second, you will be very, very, very old before
# you see two consecutive shuffles produce the same results. If you get
# a false result, you almost certainly have something wrong.
