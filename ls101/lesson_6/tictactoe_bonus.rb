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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{empty_squares(brd).join(', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def immediate_threat?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && brd.values_at(*line).count(' ') == 1
      line.each do |index|
        if brd[index] == ' '
          return index
        end
      end
    elsif brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(' ') == 1
      line.each do |index|
        if brd[index] == ' '
          return index
        end
      end
    end
  end
  nil
end

def computer_places_piece!(brd)
  if brd[5] == ' '
    brd[5] = COMPUTER_MARKER
  elsif immediate_threat?(brd)
    brd[immediate_threat?(brd)] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
  brd[5]
end

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

=begin

What am I trying to do with place_piece!? It's going to call the next
person's (player_places_piece or computer_places_piece) based on the
current_player value.  This value needs to be initialized before the loop
and set to equal the global variable at first.

What am I trying to do with alternate_player?  I'm going to change the value
of current_player

=end

current_player = FIRST_TURN
def alternate_player(current_player)
  case current_player
  when 'Choose'
    prompt "Choose who goes first, Computer or Player: "
    gets.chomp.downcase
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

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  winner = detect_winner(board)

  if someone_won?(board)
    prompt "#{winner} won!"
    if winner == 'Player'
      player_score += 1
    elsif winner == 'Computer'
      computer_score += 1
    prompt "Game Score: Player: #{player_score} | Computer: #{computer_score}"

    end
  else
    prompt "It's a tie!"
  end


  if player_score == 5 || computer_score == 5
    prompt "#{winner} wins the match!"
    break
  else
    prompt "First to 5 points wins"
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!  Good bye!"
