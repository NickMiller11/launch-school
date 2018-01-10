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

  def computer_ai_defence
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if computer_under_threat?(squares)
        return line[squares.index { |sq| sq.marker == Square::INITIAL_MARKER }]
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

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def computer_under_threat?(squares)
    markers = squares.select(&:marked_by_human?).collect(&:marker)
    return false if markers.size != 2
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
    marker == TTTGame::HUMAN_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :points

  def initialize(marker)
    @marker = marker
    reset_points
  end

  def reset_points
    self.points = 0
  end
end

class TTTGame
  include Display

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  POINTS_TO_WIN = 3

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    loop do
      reset_points
      loop do
        display_board

        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end
        increment_score
        display_result
        gets.chomp
        reset
        display_point_status
        break if win_by_points?
        display_play_again_message
      end
      display_total_winner
      break unless play_again?
    end
    display_goodbye_message
  end


  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "First player to #{POINTS_TO_WIN} points wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
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

  def computer_moves
    if board.computer_ai_defence == nil
      board[board.unmarked_keys.sample] = computer.marker
    else
      board[board.computer_ai_defence] = computer.marker
    end
  end

  # def three_identical_markers?(squares)
  #   markers = squares.select(&:marked?).collect(&:marker)
  #   return false if markers.size != 3
  #   markers.min == markers.max
  # end
  #
  # def winning_marker
  #   WINNING_LINES.each do |line|
  #     squares = @squares.values_at(*line)
  #     if three_identical_markers?(squares)
  #       return squares.first.marker
  #     end
  #   end
  #   nil
  # end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
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

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
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
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def reset_points
    human.reset_points
    computer.reset_points
  end

  def display_point_status
    puts "*** Current Points ***"
    puts "Player: #{human.points} | Computer: #{computer.points}"
    puts ""
  end

  def win_by_points?
    human.points >= POINTS_TO_WIN || computer.points >= POINTS_TO_WIN
  end

  def display_total_winner
    if human.points >= POINTS_TO_WIN
      puts "Congratulations! You're the winner!"
    else
      puts "The computer won, better luck next time!"
    end
  end
end

game = TTTGame.new
game.play
