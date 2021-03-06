module Display
  def blank_line
    puts ""
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    display_scoreboard
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    blank_line
    board.draw
    blank_line
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_play_again_message
    puts "Let's play again!"
    blank_line
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

  def display_scoreboard
    puts "*** Scoreboard ***"
    puts "Player: #{human.points} | #{computer.name}: #{computer.points}"
    blank_line
  end

  def display_total_winner
    if human.points >= TTTGame::POINTS_TO_WIN
      puts "Congratulations! #{human.name} is the winner!"
    else
      puts "#{computer.name} won, better luck next time!"
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human.name}!"
    puts "You will be playing against #{computer.name}."
    puts "First player to #{TTTGame::POINTS_TO_WIN} points wins!"
    blank_line
  end

  def joinor(choices, spacer = ', ', word = 'or')
    case choices.size
    when 0 then ''
    when 1 then choices.first
    when 2 then choices.join(" #{word} ")
    else
      choices[0..-2].join(spacer).to_s + "#{spacer}" "#{word} #{choices[-1]}"
    end
  end

  def press_enter_to_continue
    puts "Press enter to continue..."
    gets.chomp
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

  def center_square_empty?
    @squares[5].unmarked?
  end

  def check_unmarked_third_square(line, player_marker)
    squares = @squares.values_at(*line)
    if squares.select(&:marked?).map(&:marker).count(player_marker) == 2
      selected = squares.select(&:unmarked?).first
      return @squares.key(selected)
    end
    nil
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

  def full?
    unmarked_keys.empty?
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def someone_won?
    !!winning_marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
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

  def marked?
    marker != INITIAL_MARKER
  end

  def marked_by_human?
    marker == human.marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
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
end

class TTTGame
  include Display

  COMPUTER_MARKER = "O"
  POINTS_TO_WIN = 3

  attr_reader :board, :human, :computer

  def initialize
    clear_screen
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = nil
  end

  def play
    game_setup

    loop do
      reset_points
      play_game
      display_total_winner
      break unless play_again?
    end

    display_goodbye_message
  end

  private

  def assign_first_turn_marker
    @current_marker = @first_move
  end

  def computer_moves
    square = computer_offense_and_defense_logic
    square = 5 if board.center_square_empty? && !square
    square = board.unmarked_keys.sample if !square
    board[square] = computer.marker
  end

  def computer_offense_and_defense_logic
    if computer_tactics_logic(computer.marker)
      computer_tactics_logic(computer.marker)
    elsif computer_tactics_logic(human.marker)
      computer_tactics_logic(human.marker)
    end
  end

  def computer_tactics_logic(marker)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = board.check_unmarked_third_square(line, marker)
      break if square
    end
    square
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

  def game_setup
    who_moves_first
    assign_first_turn_marker
    clear_screen
    display_welcome_message
    press_enter_to_continue
    clear_screen
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

  def human_turn?
    @current_marker == human.marker
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

  def play_game
    loop do
      assign_first_turn_marker
      display_board
      play_round
      increment_score
      display_result
      display_play_again_message
      press_enter_to_continue
      reset_game
      break if win_by_points?
    end
  end

  def play_round
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def reset_game
    board.reset
    assign_first_turn_marker
    clear_screen
  end

  def reset_points
    human.reset_points
    computer.reset_points
  end

  def who_moves_first
    answer = nil
    puts "Would you like the (P)layer or (C)omputer to go first?"
    loop do
      answer = gets.chomp.upcase
      break if ['P', 'C'].include?(answer)
      puts "Please select (P)layer or (C)omputer."
    end
    answer == 'P' ? @first_move = human.marker : @first_move = computer.marker
  end

  def win_by_points?
    human.points >= POINTS_TO_WIN || computer.points >= POINTS_TO_WIN
  end
end

game = TTTGame.new
game.play
