# Wendy Kuhn 
# https://launchschool.com/posts/df1b51db

module Displayable
  def display_welcome
    clear_screen
    puts "Welcome to Tic Tac Toe!"
    puts "The first player to win #{TTTGame::MAX_POINTS} rounds wins the game!"
    puts ''
  end

  def display_board
    clear_screen
    puts "#{human.name}, you're a #{human.marker}. " \
         "#{computer.name} is an #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def display_scoreboard
    puts ''
    puts "...SCOREBOARD..."
    puts "#{human.name}:   #{scoreboard[:human]}"
    puts "#{computer.name}:   #{scoreboard[:computer]}"
    puts "................"
    puts ''
  end

  def join_or(array, final_word='or')
    case array.size
    when 0 then ''
    when 1 then array[0].to_s
    when 2 then array.join(" #{final_word} ")
    else
      array[0..-2].join(', ') + ", #{final_word} #{array[-1]}"
    end
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def clear_screen_and_display_board
    clear_screen
    board.draw
    puts ''
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_play_again_message
    puts "Ok, let's play a re-match!"
    puts ''
  end

  def display_grand_winner
    if grand_winner == human.marker
      puts "#{human.name} the grand winner!"
    elsif grand_winner == computer.marker
      puts "#{computer.name} is the grand winner!"
    else
      clear_screen
      puts "No one won this game!"
    end
  end

  def display_goodbye
    clear_screen
    puts "Thanks for playing Tic Tac Toe! Goodbye."
  end
end

class Board
  attr_accessor :grid, :winning_lines

  WINNING_POSITIONS =
    [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [7, 5, 3]
    ]

  def initialize
    @grid = {}
    @winning_lines = []
    reset!
  end

  def [](position)
    @grid[position]
  end

  def []=(position, marker)
    @grid[position].value = marker
  end

  def unmarked_squares
    @grid.keys.select { |key| @grid[key].empty }
  end

  def full?
    unmarked_squares.empty?
  end

  def winning_marker
    winning_lines.each do |line|
      return line.squares.first.value if line.won?
    end
    nil
  end

  def someone_won?
    !!winning_marker
  end

  def threatened_square(marker)
    winning_lines.each do |line|
      if line.almost_won?(marker)
        line.squares.each do |square|
          return square.position if square.empty
        end
      end
    end
    nil
  end

  def reset!
    (1..9).each { |key| @grid[key] = Square.new(key) }

    self.winning_lines =
      WINNING_POSITIONS.map do |positions|
        Line.new(@grid.values_at(*positions))
      end
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts ''
    puts "     |     |"
    puts "  #{@grid[1]}  |  #{@grid[2]}  |  #{@grid[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@grid[4]}  |  #{@grid[5]}  |  #{@grid[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@grid[7]}  |  #{@grid[8]}  |  #{@grid[9]}"
    puts "     |     |"
    puts ''
  end
  # rubocop:enable Metrics/AbcSize
end

class Line
  attr_reader :squares

  def initialize(three_position_array)
    @squares = three_position_array
  end

  def won?
    markers = squares.select { |square| !square.empty }.collect(&:value)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def almost_won?(marker)
    return false if squares.count(&:empty) != 1
    markers = squares.map(&:value)
    markers.count { |value| value == marker } == 2
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_reader :value, :empty, :position

  def initialize(position)
    @value = INITIAL_MARKER
    @position = position
    @empty = true
  end

  def value=(marker)
    @value = marker
    @empty = false
  end

  def to_s
    value
  end
end

class Player
  include Displayable

  COMPUTER_NAMES = ['Tarantino', 'Spielberg', 'Kubrick']

  attr_accessor :name, :marker

  def initialize
    @marker = nil
    @name = ''
  end

  def set_name!
    input = name
    puts "Enter your name: "
    loop do
      input = gets.chomp.capitalize
      break if input =~ /\S/
      puts "You must enter your name: "
    end
    clear_screen
    self.name = input
  end

  def choose_markers
    puts "Select your marker, any letter 'A' through 'Z': "
    human_marker = nil

    loop do
      human_marker = gets.chomp.upcase
      break if ('A'..'Z').cover?(human_marker) && human_marker.size == 1
      puts "You must enter a single letter 'A' through 'Z': "
    end

    human_marker != 'O' ? computer_marker = 'O' : 'X'

    [human_marker, computer_marker]
  end
end

class TTTGame
  include Displayable

  MAX_POINTS = 5

  attr_reader :board, :human, :computer, :first_to_move
  attr_accessor :current_player, :scoreboard

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @first_to_move = human
    @current_player = @first_to_move
    @scoreboard = { human: 0, computer: 0 }
  end

  def play
    display_welcome
    human.set_name!
    human.marker, computer.marker = human.choose_markers
    computer.name = Player::COMPUTER_NAMES.sample

    loop do
      main_game_loop
      display_grand_winner
      break unless play_again?
      reset!
      self.scoreboard = { human: 0, computer: 0 }
      display_play_again_message
    end

    display_goodbye
  end

  private

  def play_round
    loop do
      current_player_takes_turn!
      clear_screen_and_display_board if current_player == human
      break if board.someone_won? || board.full?
    end
    keep_score
  end

  def main_game_loop
    loop do
      display_board
      play_round
      display_result
      display_scoreboard
      break if grand_winner
      puts "Press enter to play the next round! (press 'q' to quit) "
      response = gets.chomp
      break if response == 'q'
      reset!
    end
  end

  def current_player_takes_turn!
    if current_player == human
      human_takes_turn!
      self.current_player = computer
    else
      computer_takes_turn!
      self.current_player = human
    end
  end

  def human_takes_turn!
    unmarked_squares = board.unmarked_squares
    puts "Choose a square (#{join_or(unmarked_squares)}): "
    square = nil

    loop do
      square = gets.chomp.to_i
      break if unmarked_squares.include?(square)
      clear_screen_and_display_board
      puts "You must enter (#{join_or(unmarked_squares)}): "
    end

    board[square] = human.marker
  end

  def computer_takes_turn!
    opportunity = board.threatened_square(computer.marker)
    threat = board.threatened_square(human.marker)

    square =
      if opportunity
        opportunity
      elsif threat
        threat
      elsif board[5].empty
        5
      else
        board.unmarked_squares.sample
      end

    board[square] = computer.marker
  end

  def keep_score
    winner = board.winning_marker

    if winner == human.marker
      scoreboard[:human] += 1
    elsif winner == computer.marker
      scoreboard[:computer] += 1
    end
  end

  def grand_winner
    if scoreboard[:human] == MAX_POINTS
      human.marker
    elsif scoreboard[:computer] == MAX_POINTS
      computer.marker
    end
  end

  def play_again?
    puts ''
    puts "Do you want to play a new game? (enter y or n): "
    response = nil

    loop do
      response = gets.chomp.downcase
      break if ['y', 'n'].include? response
      puts "You must enter 'y' or 'n': "
    end

    response == 'y'
  end

  def reset!
    board.reset!
    self.current_player = first_to_move
    clear_screen
  end
end

TTTGame.new.play