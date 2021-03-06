=begin

I copied some code from here - 
https://github.com/ianq/LC_ObjectOrientedProgramming/blob/master/lesson_2/oo_rpsls.rb

I was having a hard time trying to figure out how to make each move its own class
and still be able to compare them, i.e. doing comparisons on objects from different
classes.

After looking at some other people's code, it seems like one approach is to 
create a method in each move's individual class and basically hardcode what beats
it (or what it beats)

Update: I finally got it to work.  I'm not sure I like the version with
these as separate classes, it seems more convoluted.

=end

require 'pry'

class Rock
  def initialize
    @name = 'rock'
  end
  
  def winning_move?(other_move)
    ['paper', 'spock'].include?(other_move)
  end
  
  def to_s
    @name
  end
end

class Paper
  def initialize
    @name = 'paper'
  end
  
  def winning_move?(other_move)
    ['scissors', 'lizard'].include?(other_move)
  end
  
  def to_s
    @name
  end
end

class Scissors
  def initialize
    @name = 'scissors'
  end
  
  def winning_move?(other_move)
    ['rock', 'spock'].include?(other_move)
  end
  
  def to_s
    @name
  end
end

class Lizard
  def initialize
    @name = 'lizard'
  end
  
  def winning_move?(other_move)
    ['rock', 'scissors'].include?(other_move)
  end
  
  def to_s
    @name
  end
end

class Spock
  def initialize
    @name = 'spock'
  end
  
  def winning_move?(other_move)
    ['paper', 'lizard'].include?(other_move)
  end
  
  def to_s
    @name
  end
end

class Player
  attr_accessor :move, :name, :points

  def initialize
    set_name
    @points = 0
  end
  
  def reset_points
    @points = 0
  end
  
  def increment_point
    @points += 1
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
      puts "Please choose one of the following: #{RPSGame::VALUES.join(', ')}"
      choice = gets.chomp
      break if RPSGame::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    
    case choice
    when "rock"
      self.move = Rock.new
    when "paper"
      self.move = Paper.new
    when "scissors"
      self.move = Scissors.new
    when "lizard"
      self.move = Lizard.new
    when "spock"
      self.move = Spock.new 
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  POINTS_TO_WIN = 3
  
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def format_choices_for_display
    VALUES.map(&:capitalize).join(', ')
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
    if human.move.winning_move?(computer.move.to_s)
      computer.name
    elsif computer.move.winning_move?(human.move.to_s)
      human.name
    end
    # binding.pry
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
