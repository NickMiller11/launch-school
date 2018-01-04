module Display
  def format_choices_for_display
    Move::VALUES.map(&:capitalize).join(', ')
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def press_enter_to_continue
    puts ""
    puts "Press Enter to continue..."
    gets.chomp
  end

  def blank_line
    puts ""
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  WINNING_MOVES = {
    'rock' => ['lizard', 'scissors'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
  }

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_MOVES[value].include?(other_move.value)
  end

  def <(other_move)
    WINNING_MOVES[other_move.value].include?(value)
  end

  def to_s
    @value
  end
end

class History
  attr_accessor :log, :outcome

  def initialize
    @log = []
    @outcome = { win: [], loss: [], tie: [] }
  end
end

class Player
  attr_accessor :move, :name, :points, :history

  def initialize
    set_name
    @points = 0
    @history = History.new
  end

  def reset_points
    self.points = 0
  end

  def increment_point
    self.points += 1
  end

  def add_move_to_history
    history.log << move.value
  end

  def add_to_outcome(result)
    history.outcome[result] << move.value
  end

  def reset_log
    history.log = []
  end

  def reset_outcome
    history.outcome = { win: [], loss: [], tie: [] }
  end
end

class Human < Player
  def set_name
    name = ""
    loop do
      puts "What's your name?"
      name = gets.chomp.capitalize
      break if name =~ /\S/
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose one of the following: #{Move::VALUES.join(', ')}"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

# reduces the frequency of moves that have led to 40% or more of losses
class MrData < Player
  def set_name
    self.name = 'Mr. Data'
  end

  def choose
    move_pool = Move::VALUES.dup

    Move::VALUES.each do |move|
      if history.outcome[:loss].count(move) /
         history.outcome[:loss].size.to_f <= 0.4
        5.times do
          move_pool << move
        end
      end
    end
    self.move = Move.new(move_pool.sample)
  end
end

# chooses scissors more frequency and never chooses rock
class Skynet < Player
  def set_name
    self.name = 'Skynet'
  end

  def choose
    move_pool = Move::VALUES.dup
    move_pool.delete("rock")

    5.times do
      move_pool << "scissors"
    end

    self.move = Move.new(move_pool.sample)
  end
end

# chooses the last move that the player chose
class Tron < Player
  def set_name
    self.name = 'Tron'
  end

  def choose(human)
    self.move = if human.history.log.empty?
                  Move.new(Move::VALUES.sample)
                else
                  Move.new(human.history.log.last)
                end
  end
end

class RPSGame
  attr_accessor :human, :computer

  include Display

  POINTS_TO_WIN = 3

  def initialize
    @human = Human.new
    @computer = [MrData.new, Skynet.new, Tron.new].sample
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to #{format_choices_for_display}!"
    puts "You will be playing against #{computer.name}."
    puts "First one to #{POINTS_TO_WIN} points wins."
    blank_line
  end

  def display_moves
    blank_line
    puts "You chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_current_score
    puts "*** Current Score ***"
    puts "Player: #{human.points} | #{computer.name}: #{computer.points}"
  end

  def display_round_winner
    if determine_winner == human.name
      puts "#{human.name} won!"
    elsif determine_winner == computer.name
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
    press_enter_to_continue
    clear_screen
  end

  def display_total_winner
    if human.points == POINTS_TO_WIN
      puts("#{human.name} won the game! Great job!")
    else
      puts("#{computer.name} won the game! Better luck next time.")
    end
    blank_line
  end

  def display_final_score
    puts "*** Final Score ***"
    puts "Player: #{human.points} | #{computer.name}: #{computer.points}"
  end

  def display_move_history
    blank_line
    round = 1
    idx = 0
    human.history.log.each do |move|
      puts "Round #{round}: #{human.name} chose #{move} and #{computer.name}" \
      " chose #{computer.history.log[idx]}."
      round += 1
      idx += 1
    end
    blank_line
  end

  def display_goodbye_message
    blank_line
    puts "Thanks for playing #{format_choices_for_display}.  Good bye!"
  end

  def determine_winner
    if human.move > computer.move
      human.name
    elsif human.move < computer.move
      computer.name
    end
  end

  def increment_human_outcome
    if determine_winner == human.name
      human.add_to_outcome(:win)
    elsif determine_winner == computer.name
      human.add_to_outcome(:loss)
    else
      human.add_to_outcome(:tie)
    end
  end

  def increment_computer_outcome
    if determine_winner == human.name
      computer.add_to_outcome(:loss)
    elsif determine_winner == computer.name
      computer.add_to_outcome(:win)
    else
      computer.add_to_outcome(:tie)
    end
  end

  def increment_winner_point
    if determine_winner == human.name
      human.increment_point
    elsif determine_winner == computer.name
      computer.increment_point
    end
  end

  def update_history
    human.add_move_to_history
    computer.add_move_to_history
  end

  def point_victory
    human.points >= POINTS_TO_WIN || computer.points >= POINTS_TO_WIN
  end

  def reset
    human.reset_points
    human.reset_log
    human.reset_outcome
    computer.reset_points
    computer.reset_log
    computer.reset_outcome
  end

  def see_move_history?
    answer = nil
    loop do
      puts "Would you like to see the move history? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    answer.downcase == 'y'
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    answer.downcase == 'y'
  end

  def play_round
    human.choose
    computer.name == "Tron" ? computer.choose(human) : computer.choose
    display_moves
    increment_winner_point
    display_round_winner
    update_history
    increment_human_outcome
    increment_computer_outcome
  end

  def play_game
    display_welcome_message
    loop do
      loop do
        play_round
        break if point_victory
        display_current_score
      end
      display_final_score
      display_total_winner
      display_move_history if see_move_history?
      break unless play_again?
      reset
      clear_screen
    end
    display_goodbye_message
  end
end

RPSGame.new.play_game
