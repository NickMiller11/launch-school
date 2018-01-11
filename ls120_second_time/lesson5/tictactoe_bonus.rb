require 'pry'

module Display
  def joinor(choices, spacer = ', ', word = 'or')
    case choices.size
    when 0 then ''
    when 1 then choices.first
    when 2 then choices.join(" #{word} ")
    else
      "#{choices[0..-2].join(spacer)}" + "#{spacer}"  "#{word} #{choices[-1]}"
    end
  end
  
  def press_enter_to_continue
    puts "Press enter to continue..."
    gets.chomp
  end
  
  def blank_line
    puts ""
  end
  
  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human.name}!"
    puts "You will be playing against #{computer.name}."
    puts "First player to #{TTTGame::POINTS_TO_WIN} points wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end
  
  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end
  
  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end
  
  def display_play_again_message
    puts "Let's play again!"
    blank_line
  end
  
  def display_scoreboard
    puts "*** Scoreboard ***"
    puts "Player: #{human.points} | #{computer.name}: #{computer.points}"
    puts ""
  end
  
  def display_total_winner
    if human.points >= TTTGame::POINTS_TO_WIN
      puts "Congratulations! #{human.name} is the winner!"
    else
      puts "#{computer.name} won, better luck next time!"
    end
  end
  
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end
  
  def center_square_empty?
    @squares[5].unmarked?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
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

  def check_unmarked_third_square(line, player_marker)
    squares = @squares.values_at(*line)
    if squares.select(&:marked?).map(&:marker).count(player_marker) == 2
      selected = squares.select(&:unmarked?).first
      return @squares.key(selected)
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

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

  def marked?
    marker != INITIAL_MARKER
  end

  def marked_by_human?
    marker == human.marker
  end
end

class Player
  attr_accessor :marker, :name, :points

  def initialize
    reset_points
  end

  def reset_points
    self.points = 0
  end
end

class Computer < Player
  def initialize(marker)
    @marker = marker
    @name = ["Mr. Data", "Skynet", "Tron"].sample
    super()
  end
end

class Human < Player
  include Display
  
  def initialize
    set_name
    set_marker
    super()
  end
  
  def set_name
    name = ""
    loop do
      puts "What's your name?"
      name = gets.chomp.capitalize
      break if name =~ /\S/
      puts "Sorry, must enter a value."
    end
    blank_line
    self.name = name
  end
  
  def set_marker
    marker = nil
    loop do
      puts "What would you like your game marker to be?"
      puts "Please enter 1 character that is not a space or O."
      marker = gets.chomp
      break if /[^\s]/.match(marker) && /[^O]/.match(marker)
      puts "I'm sorry, that's an invalid choice."
      blank_line
    end
    blank_line
    self.marker = marker
  end
end

class TTTGame
  include Display

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  POINTS_TO_WIN = 3

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = human.marker
  end

  def play
    game_setup
    
    loop do
      reset_points
      loop do
        display_board
        play_round
        increment_score
        display_result
        press_enter_to_continue
        reset
        display_scoreboard
        break if win_by_points?
        display_play_again_message
      end
      display_total_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private
  
  def game_setup
    who_moves_first
    clear
    display_welcome_message
  end
  
  def play_round
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end
  
  def who_moves_first
    answer = nil
    puts "Would you like the (P)layer or (C)omputer to first?"
    loop do
      answer = gets.chomp.upcase
      break if ['P', 'C'].include?(answer)
      puts "Please select (P)layer or (C)omputer."
    end
    answer == 'P' ? @current_marker = human.marker : @current_marker = computer.marker
  end

  def human_turn?
    @current_marker == human.marker
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_ai_logic(marker)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = board.check_unmarked_third_square(line, marker)
      break if square
    end
    square
  end

  def computer_moves
    square = computer_ai_logic(computer.marker)
    
    if !square
      square = computer_ai_logic(human.marker)
    end
    
    square = 5 if !square && board.center_square_empty?
    
    square = board.unmarked_keys.sample if !square
    
    board[square] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def increment_score
    case board.winning_marker
    when human.marker
      human.points += 1
    when computer.marker
      computer.points += 1
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = human.marker
    clear
  end

  def reset_points
    human.reset_points
    computer.reset_points
  end

  def win_by_points?
    human.points >= POINTS_TO_WIN || computer.points >= POINTS_TO_WIN
  end
end

game = TTTGame.new
game.play
