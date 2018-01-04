=begin

In this version, I created a history class which has a "log" ivar
The log ivar holds each move as a string in an array

=end

require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.paper? || other_move.spock?)) ||
      (spock? && (other_move.rock? || other_move.scissors?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (lizard? && (other_move.rock? || other_move.scissors?)) ||
      (spock? && (other_move.lizard? || other_move.paper?))
  end

  def to_s
    @value
  end
end

class History
  attr_accessor :log

  def initialize
    @log = []
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
    @points = 0
  end

  def increment_point
    @points += 1
  end

  def add_move_to_history
    history.log << move.value
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose one of the following: #{Move::VALUES.join(', ')}"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
end

class MrData < Computer
  def set_name
    self.name = 'Mr. Data'
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Skynet < Computer
  def set_name
    self.name = 'Skynet'
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Tron < Computer
  def set_name
    self.name = 'Tron'
  end

  def choose
    if human.history.empty?
      self.move = Move.new(Move::VALUES.sample)
    else
      self.move = Move.new(human.history.last)
    end
  end
end

class RPSGame
  attr_accessor :human, :computer

  POINTS_TO_WIN = 5

  def initialize
    @human = Human.new
    @computer = [Tron.new].sample
  end

  def format_choices_for_display
    Move::VALUES.map(&:capitalize).join(', ')
  end

  def display_welcome_message
    puts "Welcome to #{format_choices_for_display}!"
    puts "First one to #{POINTS_TO_WIN} points wins."
  end

  def display_goodbye_message
    puts "Thanks for playing #{format_choices_for_display}.  Good bye!"
  end

  def display_moves
    puts "You chose #{human.move}."
    puts "The computer chose #{computer.move}."
  end

  def display_score
    puts "*** Current Score ***"
    puts "Player: #{human.points} | Computer: #{computer.points}"
  end

  def determine_winner
    if human.move > computer.move
      human.name
    elsif human.move < computer.move
      computer.name
    end
  end

  def display_round_winner
    if determine_winner == human.name
      puts "#{human.name} won!"
    elsif determine_winner == computer.name
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
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
    binding.pry
  end

  def point_victory
    human.points == POINTS_TO_WIN || computer.points == POINTS_TO_WIN
  end

  def reset_all_points
    human.reset_points
    computer.reset_points
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play_round
    human.choose
    computer.choose
    display_moves
    increment_winner_point
    display_round_winner
    update_history
    display_score
  end

  def play_game
    display_welcome_message
    loop do
      loop do
        play_round
        break if point_victory
      end
      break unless play_again?
      reset_all_points
    end
    display_goodbye_message
  end
end

RPSGame.new.play_game
