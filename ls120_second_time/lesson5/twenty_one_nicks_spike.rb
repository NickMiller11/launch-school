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

  def display_dealer_busted_message
    puts "Dealer has #{dealer.total} points. Dealer busted!"
  end

  def press_enter_to_continue
    puts "Press enter to continue..."
    gets.chomp
  end

  def display_final_score
    puts "Final Score: Player - #{player.total} | Dealer - #{dealer.total}"
  end

  def show_result
    if player.busted?
      puts "The dealer won!  Better luck next time!"
    elsif dealer.total > player.total
      display_final_score
      puts "The dealer won!  Better luck next time!"
    elsif dealer.busted?
      puts "You won!  Great job! You should trying playing at a casino..."
    elsif dealer.total < player.total
      display_final_score
      puts "You won!  Great job! You should trying playing at a casino..."
    else
      puts "You tied!"
    end
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

  def reset_stay
    self.stay = false
  end

  def total
    total_points = 0

    hand.each do |card|
      case card.rank
      when "Jack", "Queen", "King" then total_points += 10
      when "Ace" then total_points += 11
      else
        total_points += card.rank
      end
    end

    hand.select { |card| card.rank == "Ace" }.count.times do
      total_points -= 10 if total_points > 21
    end

    total_points
  end

  def discard_old_hand
    self.hand = []
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
      reset_stay_and_cards
      loop do
        deal_cards
        show_initial_cards
        player_turn
        if player.busted?
          display_you_busted_message
          break
        end
        dealer_turn
        if dealer.busted?
          display_dealer_busted_message
          break
        end
        show_result
        break
      end
      break unless play_again?
      clear_screen
    end
    display_goodbye_message

  end

  private

  def deal_cards
    player.discard_old_hand
    dealer.discard_old_hand
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
        clear_screen
        puts "You hit!"
        blank_line
      when 's'
        player.stay!
        clear_screen
        puts "You stay!"
        blank_line
      end
      show_cards
      break if player.stay? || player.busted?
    end
  end

  def dealer_turn
    loop do
      break if dealer.total > 17
      clear_screen
      puts "Dealer hits!"
      blank_line
      deck.deal_one_card(dealer.hand)
      show_cards
      press_enter_to_continue
    end
    clear_screen
    puts "Dealer stays!"
    blank_line
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

  def reset_stay_and_cards
    player.reset_stay
    dealer.reset_stay
    self.deck = Deck.new
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "I'm sorry, that's not a valid response."
    end
    answer == 'y'
  end
end

Game.new.start
