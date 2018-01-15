require 'yaml'

MESSAGES = YAML.load_file('twenty_one_messages.yml')

module Displayable
  def clear_screen
    system('cls') || system('clear')
  end

  def display_welcome
    clear_screen
    puts MESSAGES['welcome']
    puts ''
  end

  def display_instructions
    clear_screen
    puts MESSAGES['instructions'] % { BLACKJACK: TwentyOneGame::BLACKJACK }
    puts ''
    puts MESSAGES['opponent_name'] % { dealer: dealer }
    puts MESSAGES['start_game'] % { player: player }
    gets
  end
end

class Gambler
  attr_accessor :hand, :name

  def initialize
    @hand = Hand.new
    @name = ''
  end

  def busted?
    hand.total > TwentyOneGame::BLACKJACK
  end

  def twenty_one?
    hand.total == TwentyOneGame::BLACKJACK
  end

  def bust_or_twenty_one?
    busted? || twenty_one?
  end

  def to_s
    name
  end

  def display_total_of_hand
    puts ''
    puts MESSAGES['gambler_total'] % { name: name, total: hand.update_total }
  end
end

class Player < Gambler
  def set_name
    name = ''
    loop do
      puts MESSAGES['get_player_name']
      name = gets.chomp
      break if name =~ /\S/
      puts MESSAGES['name_required']
    end
    self.name = name.capitalize
  end

  def take_turn
    puts ''
    puts MESSAGES['hit_or_stay']
    input = nil

    loop do
      input = gets.chomp.downcase
      break if ['h', 's'].include? input
      puts MESSAGES['must_hit_or_stay']
    end

    input
  end

  def show_hand
    puts MESSAGES['player_cards'] % { name: name }
    puts hand.to_s
    puts ''
  end
end

class Dealer < Gambler
  DEALER_STAYS_AT = 17

  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def initialize
    super
    @name = ROBOTS.sample
  end

  def take_turn
    'hit' if hand.update_total < DEALER_STAYS_AT
  end

  def show_hand
    puts MESSAGES['dealer_cards'] % { name: name }
    hand.cards.reverse_each do |card|
      if card.showing
        puts card
      else
        puts MESSAGES['unknown_card']
      end
    end
  end

  def show_final_hand
    puts MESSAGES['dealer_cards'] % { name: name }
    hand.cards.reverse_each { |card| puts card }
  end
end

class Card
  FACE_CARD_VALUE = 10
  ACE_DEFAULT_VALUE = 11

  attr_reader :suit, :rank, :value
  attr_accessor :showing

  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  VALUES =
    RANKS.each_with_object({}) do |rank, values|
      values[rank] =
        if rank.is_a?(Integer)
          rank
        elsif rank == 'Ace'
          ACE_DEFAULT_VALUE
        else
          FACE_CARD_VALUE
        end
    end

  def initialize(suit, rank)
    @showing = false
    @suit = suit
    @rank = rank
    @value = VALUES[rank]
  end

  def to_s
    MESSAGES['rank_and_suit'] % { rank: rank, suit: suit }
  end
end

class Deck
  attr_reader :cards

  STANDARD_52 =
    Card::SUITS.each_with_object([]) do |suit, deck|
      Card::RANKS.each { |rank| deck << Card.new(suit, rank) }
    end

  def initialize
    @cards = STANDARD_52
    @size = @cards.size
  end

  def size
    cards.size
  end

  def initial_deal!(gambler1, gambler2)
    cards.shuffle!

    [gambler1, gambler2].each do |gambler|
      hand = gambler.hand.cards
      2.times { hand << cards.pop }
      hand.last.showing = true
    end
  end

  def hit!(gambler)
    hand = gambler.hand
    hand.cards << cards.pop
    hand.cards.last.showing = true
    hand.update_total
  end
end

class Hand
  attr_accessor :cards, :total

  def initialize
    @cards = []
    @total = 0
  end

  def >(other_player)
    total > other_player.total
  end

  def to_s
    cards.each(&:to_s)
  end

  def update_total
    self.total = cards.map(&:value).inject(:+)

    cards.select { |card| card.rank == 'Ace' }.count.times do
      break if total <= TwentyOneGame::BLACKJACK
      self.total -= 10
    end

    total
  end
end

class TwentyOneGame
  include Displayable

  BLACKJACK = 21

  attr_accessor :deck, :player, :dealer

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    display_welcome
    player.set_name
    display_instructions

    main_game_loop

    clear_screen
    puts MESSAGES['goodbye']
  end

  private

  def main_game_loop
    loop do
      deck.initial_deal!(player, dealer)

      player_turn
      dealer_turn unless player.busted?

      display_final_outcome
      play_again? ? reset! : break
    end
  end

  def player_turn
    loop do
      display_hands
      player.display_total_of_hand

      break if player.busted?

      break unless player.take_turn == 'h'
      deck.hit!(player)
    end
  end

  def dealer_turn
    loop do
      display_hands

      break if dealer.bust_or_twenty_one?

      if dealer.take_turn == 'hit'
        puts "#{dealer} chose to hit..."
        sleep 1.5
        deck.hit!(dealer)
      else
        puts "#{dealer} chose to stay..."
        sleep 1.5
        break
      end
    end
  end

  def determine_winner
    if player.busted? || dealer.twenty_one? || twenty_one_tie?
      dealer
    elsif dealer.busted? || player.twenty_one?
      player
    else
      compare_hands
    end
  end

  def buster
    if player.busted?
      player
    elsif dealer.busted?
      dealer
    end
  end

  def twenty_one_tie?
    player.hand.total == BLACKJACK && dealer.hand.total == BLACKJACK
  end

  def compare_hands
    if dealer.hand > player.hand
      dealer
    elsif player.hand > dealer.hand
      player
    end
  end

  def display_hands
    clear_screen
    player.show_hand
    dealer.show_hand
    puts ''
  end

  def display_final_hands
    clear_screen

    player.show_hand
    dealer.show_final_hand
  end

  def display_buster
    puts ''
    puts MESSAGES['buster_busted'] % { buster: buster.name }
  end

  def display_winner
    puts ''
    winner = determine_winner

    if winner
      puts MESSAGES['winner_won'] % { winner: winner.name }
    else
      puts MESSAGES['push'].upcase
    end
  end

  def display_final_outcome
    display_final_hands

    player.display_total_of_hand
    dealer.display_total_of_hand

    display_buster if buster
    display_winner
  end

  def play_again?
    response = nil
    puts ''
    puts MESSAGES['play_again']

    loop do
      response = gets.chomp.downcase
      break if ['y', 'n'].include? response
      puts MESSAGES['valid_y_or_n']
    end

    response == 'y'
  end

  def reset!
    self.deck = Deck.new
    player.hand = Hand.new
    dealer.hand = Hand.new
  end
end

TwentyOneGame.new.start