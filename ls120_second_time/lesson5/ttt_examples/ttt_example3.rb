# Srdjan Coric
# https://launchschool.com/posts/5936fe32

require 'yaml'

MESSAGES = YAML.load_file('ttt.yml')

module Messaging
  private

  def prompt(message)
    puts "=> #{message}"
  end

  def message(message)
    MESSAGES[message]
  end

  def joinor(arr, delimiter = ', ', word = 'or')
    result = []
    arr.each { |elem| result << elem }
    case result.size
    when 0 then ''
    when 1 then result.first
    when 2 then result.join(" #{word} ")
    else
      result[-1] = "#{word} #{arr.last}"
      result.join(delimiter)
    end
  end
end

module DisplayMessages
  private

  def display_welcome
    prompt(message('line'))
    prompt("Welcome to TicTacToe game #{human.name}!")
    prompt(message('line'))
    sleep(0.75)
  end

  def display_rules
    prompt(message('rules'))
    prompt(message('line'))
    sleep(1)
    prompt(message('general_rules'))
    prompt(message('players'))
    prompt(message('player_rules'))
    prompt(message('object_rules'))
    prompt(message('end_rules'))
    prompt(message('winning_rules'))
  end

  def display_mark
    prompt("You are #{human.marker}, Computer is #{computer.marker}.")
    puts
  end

  def display_prompt_enter
    prompt(message('line'))
    loop do
      prompt(message('enter'))
      entry = gets.chomp
      break if entry == ''
      prompt(message('invalid_input'))
    end
  end

  def display_board
    board.draw
  end

  def display_round_start
    prompt(message('round'))
    prompt(message('line'))
  end

  def display_new_turn
    display_mark
    display_board
  end

  def display_new_round
    clear
    display_round_start
    display_score
    sleep(0.5)
  end

  def display_result
    display_board

    case board.winning_marker
    when human.marker
      prompt(message('won_round'))
    when computer.marker
      prompt(message('loss_round'))
    else
      prompt(message('full_board'))
    end
  end

  def display_score
    prompt("Score -> #{human.score} : #{computer.score}")
    prompt(message('line'))
  end

  def display_end_game_message
    prompt("Congratulations #{human.name}! You have won!") if human.score == 3
    prompt("Too bad #{human.name}...You have lost!") if computer.score == 3
    prompt(message('line'))
    sleep(0.75)
    prompt(message('end_game'))
  end
end

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    squares[num].marker = marker
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      square_values = squares.values_at(*line)
      if three_identical_markers?(square_values)
        return square_values.first.marker
      end
    end
    nil
  end

  def detect_opportunity_line
    WINNING_LINES.each do |line|
      if squares.values_at(*line).select(&:computer_marked?).count == 2 &&
         squares.values_at(*line).select(&:unmarked?).count == 1
        return line
      end
    end
    nil
  end

  def take_opportunity
    detect_opportunity_line.each do |square|
      squares[square].marker = TTTGame::COMPUTER_MARKER if
        squares[square].unmarked?
    end
  end

  def detect_threat_line
    WINNING_LINES.each do |line|
      if squares.values_at(*line).select(&:human_marked?).count == 2 &&
         squares.values_at(*line).select(&:unmarked?).count == 1
        return line
      end
    end
    nil
  end

  def defend_threat
    detect_threat_line.each do |square|
      squares[square].marker = TTTGame::COMPUTER_MARKER if
        squares[square].unmarked?
    end
  end

  def center_square_free?
    squares[5].unmarked?
  end

  def take_center
    squares[5].marker = TTTGame::COMPUTER_MARKER
  end

  def take_random_square
    squares[unmarked_keys.sample].marker = TTTGame::COMPUTER_MARKER
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def human_marked?
    marker == TTTGame::HUMAN_MARKER
  end

  def computer_marked?
    marker == TTTGame::COMPUTER_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class Human < Player
  include Messaging
  attr_accessor :name

  def prompt_name
    name = ''
    loop do
      prompt(message('name'))
      name = gets.chomp
      break unless invalid_input?(name)
      prompt(message('invalid_input'))
    end
    self.name = name.capitalize
  end

  def invalid_input?(name)
    name.empty? || name.match(/\s+/)
  end
end

class Computer < Player
end

class TTTGame
  include Messaging
  include DisplayMessages

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  attr_accessor :current_marker

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
  end

  def play
    human.prompt_name
    display_welcome
    display_rules
    display_prompt_enter
    loop do
      new_round
      game_flow
      display_result
      calculate_score
      board.reset
      break if end_game?
      display_prompt_enter
    end
    display_score
    display_end_game_message
  end

  private

  def first_to_play
    @current_marker = [HUMAN_MARKER, COMPUTER_MARKER].sample
  end

  def new_round
    first_to_play
    display_new_round
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    if board.detect_opportunity_line
      board.take_opportunity
    elsif board.detect_threat_line
      board.defend_threat
    elsif board.center_square_free?
      board.take_center
    else
      board.take_random_square
    end
  end

  def current_player_moves
    if @current_marker == HUMAN_MARKER
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    current_marker == human.marker
  end

  def game_flow
    loop do
      display_new_turn if human_turn?
      current_player_moves
      break if end_round?
      clear if human_turn? && board.unmarked_keys.size < 8
    end
  end

  def end_round?
    board.full? || board.someone_won?
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def calculate_score
    human.score += 1 if board.winning_marker == human.marker
    computer.score += 1 if board.winning_marker == computer.marker
  end

  def end_game?
    human.score == 3 || computer.score == 3
  end
end

game = TTTGame.new
game.play