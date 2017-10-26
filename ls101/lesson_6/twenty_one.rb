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
X way to calculate aces
X create a loop for player's hands
X create a loop for dealer's hands
X create busted? method
X calculate winner
X declare winner
X display more than two cards in a hands
X make it so that when you bust, it doesn't say you won
=end

require 'pry'

CARD_VALUES = {
  "A" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
  "8" => 8, "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10
}

CARD_NAMES = {
  "A" => "Ace", "2" => "2", "3" => "3", "4" => "4", "5" => "5",
  "6" => "6", "7" => "7", "8" => "8", "9" => "9", "10" => "10",
  "J" => "Jack", "Q" => "Queen", "K" => "King"
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
end

def new_dealer_hand(deck)
  dealers_hand = []
  dealers_hand << deck.shuffle.pop << deck.shuffle.pop
end

def display_hands(player, dealer)
  player_display_hand = []
  dealer_display_hand = []

  dealer.each do |card|
    dealer_display_hand << card[0]
  end
  dealer_display_hand[-1] = 'unknown card'
  puts "Dealer has: #{dealer_display_hand.join(' and ')}"

  player.each do |card|
    player_display_hand << card[0]
  end
  puts "You have: #{player_display_hand.join(' and ')}"
end

def total_score(hand) # calculate hand total considering ace value
  total = 0
  hand.each do |card|
    card[0] == "A" && total <= 10 ? total += 11 : total += CARD_VALUES[card[0]]
  end
  total
end

def hit(deck, hand) # add a card to your hand
  hand << deck.shuffle.pop
end

def busted?(score)
  score > 21
end

def calculate_winner(player, dealer)
  if busted?(player)
    puts "Dealer won!"
  elsif busted?(dealer)
    puts "You won!"
  elsif player > dealer
    puts "You won!"
  else
    puts "Dealer won!"
  end
end

def final_score(player, dealer)
  puts "Final score: player - #{player}, dealer - #{dealer}"
end

deck = initialize_deck
players_hand = new_player_hand(deck)
dealers_hand = new_dealer_hand(deck)

players_score = total_score(players_hand)
dealers_score = total_score(dealers_hand)

# player's turn
answer = nil
loop do
  display_hands(players_hand, dealers_hand)
  puts "hit or stay?"
  answer = gets.chomp
  hit(deck, players_hand) if answer.downcase == 'hit'
  players_score = total_score(players_hand)
  break if answer == 'stay' || busted?(players_score)
end

if busted?(players_score)
  puts "Sorry, you busted!  Thanks for playing."
else
  puts "You chose to stay!"
end

# dealer's turn
loop do
  break if busted?(players_score) || total_score(dealers_hand) > 16 ||
           busted?(dealers_score)
  hit(deck, dealers_hand)
  dealers_score = total_score(dealers_hand)
  display_hands(players_hand, dealers_hand)
end

calculate_winner(players_score, dealers_score)
final_score(players_score, dealers_score)
