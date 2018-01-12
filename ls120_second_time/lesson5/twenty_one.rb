=begin

Twenty-One is a card game consisting of a dealer and a player, where the participants
try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins.  If both player and dealer stays, then the highest
  total wins.
- If both totals are equal, then it's a tie, and nobody wins.

Nouns: player, dealer, card, deck, total, participant, game
Verbs: busts, deal, hit, stay

Participant
  - hits
  - stay
  - busted
  - total
Dealer < Participant
Player < Participant
Card
Deck
  - deal
Game
  - start
  
=end

require 'pry'

module Display
  def blank_line
    puts ""
  end
  
  def clear_screen
    system('clear') || system('cls')
  end
  
  def display_welcome_message
    clear_screen
    puts "Welcome to Twenty-One!"
  end
  
  def display_goodbye_message
    blank_line
    puts "Thanks for playing Twenty-One!  Goodbye!"
  end
end

class Participant
  attr_accessor :hand
  
  def initialize
    @hand = []
  end
  
  def hit
    binding.pry
    deck.deal_one_card(hand)
    binding.pry
  end
  
  def stay
    
  end
  
  def busted?
    
  end
  
  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

class Player < Participant
  
end

class Dealer < Participant

end

class Deck
  attr_reader :deck
  
  def initialize
    @deck = []
    Card::SUIT.each do |suit|
      Card::RANK.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end
  
  def initial_deal(hand)
   2.times do 
     hand << deck.pop
   end
  end
  
  def deal_one_card(hand)
    hand << deck.pop
  end
  
  def shuffle!
    @deck.shuffle!
  end
end

class Card
  attr_reader = :suit, :rank
  
  RANK = (2..10).to_a.concat(["Jack", "Queen", "King", "Ace"]) 
  SUIT = ["Clubs", "Diamonds", "Hearts", "Spades"]
  
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
  
  def to_s
    "#{@suit} of #{@rank}"
  end
end

class Game
  include Display
  
  attr_accessor :player, :dealer, :deck
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end
  
  def start
    display_welcome_message
    loop do
      deal_cards
      show_initial_cards
      
      loop do
        player_turn
        binding.pry
        show_cards
        break
        dealer_turn
        show_result
        break if busted? || both_stay?
      end
      break unless play_again?
      
    end
    display_goodbye_message
    
  end
  
  def deal_cards
    deck.initial_deal(player.hand)
    deck.initial_deal(dealer.hand)
  end
  
  def show_initial_cards
    blank_line
    puts "In your hand, you have:"
    puts "1. #{player.hand.first}"
    puts "2. #{player.hand.last}"
    blank_line
    puts "In the dealer's hand, they have:"
    puts "1. #{dealer.hand.first}"
    puts "2. [Unknown]"
    blank_line
  end
  
  def player_turn
    move = get_player_move
    binding.pry
    case move
    when 'h' then deck.deal_one_card(player.hand)
    when 's' then player.stay
    end
  end

  def get_player_move
    puts "Would you like to (h)it or (s)tay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "I'm sorry, that's not a valid choice."
    end
    answer
  end
  
  def show_player_cards
    puts "You have:"
    player.hand.each do |card|
      puts card
    end
    blank_line
  end
  
  def show_dealer_cards
    dealer_hand = dealer.hand[0..-2]
    puts "Dealer has:"
    dealer_hand.each do |card|
      puts card
    end
  end
  
  def show_cards
    show_player_cards
    show_dealer_cards
  end
end

Game.new.start
  
