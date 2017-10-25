=begin

1. Initialize deck
2. Deal cards to the player and dealer
3. Player turn: hit or stay
 - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
 - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

To do:
X pick a data structure for deck (hash), player's cards (nested array),
and dealer's cards (nested array)
X create a method to intialize a new deck
X create a method to deal new hands to player and computer
X create a method to display hands
- way to calculate aces
- create a loop for player's hands
- create a loop for dealer's hands
- declare winner

=end

require 'pry'

CARD_VALUES = {
  "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8,
  "9"=>9, "10"=>10, "J"=>10, "Q"=>10, "K"=>10
}

CARD_NAMES = {
  "1"=>"Ace", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7",
  "8"=>"8", "9"=>"9", "10"=>"10", "J"=>"Jack", "Q"=>"Queen", "K"=>"King"
}

def initialize_deck
  deck = []
  ['S', 'C', 'D', 'H'].each do |suit|
    2.upto(10) { |num| deck << [num.to_s, suit] }
    deck << ["J", suit]
    deck << ["Q", suit]
    deck << ["K", suit]
    deck << ["A", suit]
  end
  deck
end

def new_player_hand(deck)
  players_hand = []
  players_hand << deck.shuffle.pop << deck.shuffle.pop
  players_hand
end

def new_dealer_hand(deck)
  dealers_hand = []
  dealers_hand << deck.shuffle.pop << deck.shuffle.pop
  dealers_hand
end

def display_hands(player, dealer)
  puts "Dealer has: #{CARD_NAMES[dealer[1][0]]} and unknown card"
  puts "You have: #{CARD_NAMES[player[0][0]]} and #{CARD_NAMES[player[1][0]]}"
end


def busted
end

deck = initialize_deck
players_hand = new_player_hand(deck)
dealers_hand = new_dealer_hand(deck)
display_hands(players_hand, dealers_hand)

# player's turn
answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?
end

if busted?
  # end of game or ask user to play again?
else
  puts "You chose to stay!"
end

# dealer's turn
loop do


end
