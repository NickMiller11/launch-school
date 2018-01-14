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

# working on dealer_turn method
# need to add logic if dealer busts

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

  def display_you_busted_message
    puts "You have #{player.total} points. You busted!"
  end
end

class Participant
  attr_accessor :hand, :stay

  def initialize
    @hand = []
    @stay = false
  end

  def stay?
    stay
  end

  def stay!
    self.stay = true
  end

  def busted?
    total > 21
  end

  def total
    total = 0

    hand.each do |card|
      case card.rank
      when "Jack", "Queen", "King" then total += 10
      when "Ace" then total += 11
      else
        total += card.rank
      end

      hand.select { |card| card.rank == "Ace" }.count.times do
        total -= 10 if total > 21
      end
    end
    total
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
        @deck << Card.new(suit, rank)
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
  attr_reader :suit, :rank

  RANK = (2..10).to_a.concat(["Jack", "Queen", "King", "Ace"])
  SUIT = ["Clubs", "Diamonds", "Hearts", "Spades"]

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@rank} of #{@suit}"
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
      loop do
        deal_cards # need to get rid of old cards if playing again
        show_initial_cards
        player_turn
        if player.busted?
          display_you_busted_message
          break
        end
        dealer_turn
        binding.pry
        show_result # not implemented
      end
      break unless play_again?
      clear_screen
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
    puts "2. [Unknown Card]"
    blank_line
  end

  def player_turn
    loop do
      move = get_player_move
      case move
      when 'h'
        deck.deal_one_card(player.hand)
        puts "You hit!"
      when 's'
        player.stay!
        puts "You stay!"
      end
      blank_line
      show_cards
      binding.pry
      break if player.stay? || player.busted?
    end
  end

  def dealer_turn
    loop do
      break if dealer.total > 17
      puts "Dealer hits!"
      deck.deal_one_card(dealer.hand)
    end
    puts "Dealer stays!"
    dealer.stay
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
    puts "[Unknown Card]"
    blank_line
  end

  def show_cards
    show_player_cards
    show_dealer_cards
  end

  def both_stay?
    player.stay? && dealer.stay?
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "I'm sorry, that's not a valid response."
    end
    answer = 'y'
  end
end

Game.new.start
