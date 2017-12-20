=begin
 --> Currently working on the Player class
=end

# Twenty-One is a card game consisting of a dealer and a player, where the 
# participants try to get as close to 21 as possible without going over.

# Here is an overview of the game:
# - Both participants are initially dealt 2 cards from a 52-card deck.
# - The player takes the first turn, and can "hit" or "stay".
# - If the player busts, he loses. If he stays, it's the dealer's turn.
# - The dealer must hit until his cards add up to at least 17.
# - If he busts, the player wins. If both player and dealer stays, 
#   then the highest total wins.
# - If both totals are equal, then it's a tie, and nobody wins.

# Nouns - card, player, dealer, participant, deck, game, total
# Verbs - deal, hit, stay, busts

# Player
# - hit
# - stay
# - busted?
# - total

# Dealer
# - hit
# - stay
# - busted?
# - total
# - deal (should this be here, or in Deck?)

# Participant

# Deck
# - deal (should this be here, or in Dealer?)

# Card

# Game
# - start

# ------ SPIKE ----------

class Player < Participant
  def set_name 
  
  def hit
  end
  
  def stay
  end
  
  def busted?
  end
  
  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

class Dealer 
  def initialize
    # seems very similar to Player...do we even need this?
  end
  
  def deal
    # does the dealer or the deck deal?
  end
  
  def hit
  end
  
  def stay
  end
  
  def busted?
  end
  
  def total
  end
end

class Participant
  include Hand
  
  attr_accessor :name, :cards
  def initialize
    @cards = []
    set_name
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end
  
  def total
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.face.to_i
      end
    end
    
    # correct for Aces
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    
    total
  end
  
  def add_card(new_card)
    cards << new_card
  end
  
  def busted?
    total > 21
  end
end

class Deck
  attr_accessor :cards
  
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit,face)
      end
    end
    
    scramble!
  end
  
  def scramble!
    cards.shuffle!
  end
  
  def deal_one
    cards.pop
  end
end

class Card
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  
  def initialize(suit, face)
    @suit = suit
    @face = face
  end
  
  def to_s
    "The #{face} of #{suit}"
  end
  
  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end
  
  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end
  
  def ace?
    face == 'Ace'
  end
  
  def king?
    face == 'King'
  end
  
  def queen?
    face == 'Queen'
  end
  
  def jack?
    face == 'Jack'
  end
end

class Game
  def start
    # what's the sequence of steps to execute the game play?
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start