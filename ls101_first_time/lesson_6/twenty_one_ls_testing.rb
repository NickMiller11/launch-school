
=begin

Ok, so how do I do this 'count games thing.'  I want to either let the player
decide if they want to continue games until 5 points, or let them decide
if they want to continue to another round of 5.  It might be annoying to do both.
How about I ask them if they want to play each game, and then end the program once
someone reaches 5 points.

loop
  keep track of points
  loop

  do you want to play again?
  end
  display final score
end

=end


require "pry"

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(score)
  score > 21
end

def detect_result(dealer_score, player_score)
  player_total = player_score
  dealer_total = dealer_score

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_score, player_score)
  result = detect_result(dealer_score, player_score)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def compare_cards(d_cards, d_score, p_cards, p_score)
  puts "==========="
  prompt "Dealer has #{d_cards}, for a total of: #{d_score}"
  prompt "Player has #{p_cards}, for a total of: #{p_score}"
  puts "==========="
end

def round_points(d_points, p_points)
  prompt "Game Score: Player - #{p_points}, Dealer - #{d_points}"
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

player_points = 0
dealer_points = 0

loop do

  prompt "Welcome to Twenty-One!"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_score = total(player_cards)
  dealer_score = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_score}." #{total(player_cards)}

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h', or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      #binding.pry
      player_score = total(player_cards)
      #binding.pry
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_score}"
    end

    break if player_turn == 's' || busted?(player_score)
  end

  if busted?(player_score)
    compare_cards(dealer_cards, dealer_score, player_cards, player_score)
    display_result(dealer_score, player_score)
    dealer_points += 1
    round_points(dealer_points, player_points)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_score}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_score >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_score = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_score)
    prompt "Dealer total is now; #{dealer_score}"
    compare_cards(dealer_cards, dealer_score, player_cards, player_score)
    display_result(dealer_score, player_score)
    player_points += 1
    round_points(dealer_points, player_points)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_score}"
  end

  compare_cards(dealer_cards, dealer_score, player_cards, player_score)
  display_result(dealer_score, player_score)
  if detect_result(dealer_score, player_score) == :player
    player_points += 1
  elsif detect_result(dealer_score, player_score) == :dealer
    dealer_points += 1
  end
  round_points(dealer_points, player_points)
  if player_points == 5 || dealer_points == 5
    break
  else
    break unless play_again?
  end
end

prompt "Thank you for playing Twenty-One! Good Bye!"
