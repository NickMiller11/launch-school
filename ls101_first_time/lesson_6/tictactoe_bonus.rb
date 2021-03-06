

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_TURN = 'Player'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator=', ', final='or ')
  separator = ' ' if arr.size == 2
  arr[-1] = final + ' ' + arr[-1].to_s unless arr.size == 1
  arr.join(separator)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def immediate_threat?(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    # binding.pry
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

#   WINNING_LINES.each do |line|
#     if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && brd.values_at(*line).count(' ') == 1
#       line.each do |index|
#         if brd[index] == ' '
#           return index
#         end
#       end
#     elsif brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(' ') == 1
#       line.each do |index|
#         if brd[index] == ' '
#           return index
#         end
#       end
#     end
#   end
#   nil
# end

def computer_places_piece!(brd)
  square = nil

  # defense
  WINNING_LINES.each do |line|
    square = immediate_threat?(line, brd, PLAYER_MARKER)
    break if square
  end

  # offense
  if !square
    WINNING_LINES.each do |line|
      square = immediate_threat?(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # pick random square
  if !square
    square = empty_squares(brd).sample
  end


  brd[square] = COMPUTER_MARKER
end

# def computer_places_piece!(brd)
#   if brd[5] == ' '
#     brd[5] = COMPUTER_MARKER
#   elsif immediate_threat?(WINNING_LINES, brd)
#     brd[immediate_threat?(WINNING_LINES, brd)] = COMPUTER_MARKER
#   else
#     square = empty_squares(brd).sample
#     brd[square] = COMPUTER_MARKER
#   end
#   brd[5]
# end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def scorekeeping(brd, player_score, computer_score)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
    if detect_winner(brd) == 'Player'
      player_score += 1
      prompt "Game Score: Player: #{player_score} | Computer: #{computer_score}"
    elsif detect_winner(brd) == 'Computer'
      computer_score += 1
      prompt "Game Score: Player: #{player_score} | Computer: #{computer_score}"
    end
  else
    prompt "It's a tie!"
    prompt "Game Score: Player: #{player_score} | Computer: #{computer_score}"
  end
end

def alternate_player(current_player)
  case current_player
  when 'Player'
    'Computer'
  when 'Computer'
    'Player'
  end
end

def place_piece!(brd, current_player )
  case current_player
  when 'Player'
    player_places_piece!(brd)
  when 'Computer'
    computer_places_piece!(brd)
  end
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board
  current_player = FIRST_TURN
  
  if current_player == 'Choose'
    prompt "Choose who goes first, Computer or Player: "
    current_player = gets.chomp.capitalize
  end
  
  loop do
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
  end

  scorekeeping(board, player_score, computer_score)

  if player_score == 5 || computer_score == 5
    prompt "#{detect_winner(brd)} wins the match!"
    break
  else
    prompt "First to 5 points wins"
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  
end

prompt "Thanks for playing Tic Tac Toe!  Good bye!"
