module Display
  def blank_line
    puts ""
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome_message
    puts "Welcome to Twenty-One, #{player.name}!"
    blank_line
  end

  def display_goodbye_message
    blank_line
    puts "Thanks for playing Twenty-One!  Goodbye!"
  end

  def display_you_busted_message
    puts "Oh no! You busted!"
  end

  def display_dealer_busted_message
    puts "Dealer has #{dealer.total} points. Dealer busted!"
  end

  def press_enter_to_continue
    puts "Press enter to continue..."
    gets.chomp
  end

  def display_current_player_score
    puts "#{player.name}'s current point total: #{player.total}"
  end

  def display_final_score
    puts "Final Score: Player - #{player.total} | Dealer - #{dealer.total}"
  end

  def display_player_won_message
    puts ["You won! Great job, #{player.name}! Try playing at a casino!",
          "Yon won! You should go pro, #{player.name}!",
          "Yon won! Let's face it, the computer isn't THAT difficult."].sample
  end

  def display_dealer_won_message
    puts ["The dealer won!  Better luck next time #{player.name}!",
          "The dealer won!  You've got to keep trying!",
          "The dealer won!  Good thing this wasn't for money!"].sample
  end

  def show_busted_result
    if player.busted?
      display_you_busted_message
      blank_line
      display_dealer_won_message
    elsif dealer.busted?
      display_dealer_busted_message
      blank_line
      display_player_won_message
    end
  end

  def show_points_result
    if dealer.total > player.total
      display_dealer_won_message
    elsif dealer.total < player.total
      display_player_won_message
    else
      puts "You tied!"
    end
  end

  def show_result
    player.busted? || dealer.busted? ? show_busted_result : show_points_result
  end

  def display_result_and_score
    show_result
    blank_line
    display_final_score
  end

  def display_hit_message
    puts "#{self.class} hits!"
  end
end

class Participant
  include Display

  attr_accessor :hand, :stay, :name
  attr_reader :deck

  def initialize(deck)
    @hand = []
    @stay = false
    @deck = deck
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

  def reset_stay_indicator
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

  def hit!
    clear_screen
    display_hit_message
    blank_line
    deck.deal_one_card(hand)
  end
end

class Player < Participant
  def initialize(deck)
    @name = set_name
    super
  end

  def set_name
    clear_screen
    puts "What is your name?"
    name = ""
    loop do
      name = gets.chomp.capitalize
      break if name =~ /\S/
      puts "Sorry, must enter a value."
    end
    blank_line
    self.name = name
  end

  def show_cards
    puts "#{name} has:"
    hand.each do |card|
      puts "=> #{card}"
    end
    blank_line
  end

  def assign_move
    move = request_player_move
    case move
    when 'h'
      hit!
    when 's'
      stay!
      clear_screen
      puts "You stay!  Dealer's turn."
      blank_line
      press_enter_to_continue
    end
  end

  private

  def request_player_move
    puts "Would you like to (h)it or (s)tay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "I'm sorry, that's not a valid choice."
    end
    answer
  end
end

class Dealer < Participant
  def show_cards
    dealer_hand = hand[0..-2]
    puts "Dealer has:"
    dealer_hand.each do |card|
      puts "=> #{card}"
    end
    puts "=> [Unknown Card]"
    blank_line
  end

  def assign_move
    clear_screen
    hit! if total < 17
  end
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

  private

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
    @deck = Deck.new
    @player = Player.new(deck)
    @dealer = Dealer.new(deck)
  end

  def start
    display_welcome_message

    loop do
      reset_game
      main_game
      show_points_and_cards
      display_result_and_score
      break unless play_again?
      clear_screen
    end

    display_goodbye_message
  end

  private

  def main_game
    deal_cards
    show_points_and_cards
    player_turn
    dealer_turn unless player.busted?
  end

  def deal_cards
    player.discard_old_hand
    dealer.discard_old_hand
    deck.initial_deal(player.hand)
    deck.initial_deal(dealer.hand)
  end

  def player_turn
    loop do
      player.assign_move
      player.stay? || player.busted? ? break : show_points_and_cards
    end
  end

  def dealer_turn
    loop do
      break if dealer.total >= 17
      dealer.assign_move
      show_points_and_cards
      press_enter_to_continue
      clear_screen
    end
    puts "Dealer stays!"
    blank_line
  end

  def show_cards
    player.show_cards
    dealer.show_cards
  end

  def show_points_and_cards
    show_cards
    display_current_player_score
    blank_line
  end

  def reset_game
    player.reset_stay_indicator
    dealer.reset_stay_indicator
    self.deck = Deck.new
  end

  def play_again?
    blank_line
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
