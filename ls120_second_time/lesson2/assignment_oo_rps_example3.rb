require 'yaml'

MESSAGES = YAML.load_file('rps.yml')

module FormattingInput
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
    prompt("Welcome to #{RPSGame::OPTIONS.join(', ')} game #{human.name}!")
    sleep(0.75)
    puts
    prompt("You are playing against #{computer.name}!")
    puts
    sleep(0.75)
    prompt(message('fun'))
    puts message('line')
    sleep(1)
  end

  def display_rules
    prompt(message('rules'))
    puts
    prompt(message('winning_rules'))
    prompt(message('line'))
    idx = 1
    sleep(1.5)
    RPSGame::WINNING_RULES.each do |key, value|
      prompt("#{idx} #{key.capitalize} beats #{joinor(value, ',', 'and')}")
      idx += 1
    end
    sleep(1.5)
  end

  def display_options
    puts
    prompt(message('options'))
    puts(message('line'))
    sleep(1)
  end

  def display_choices
    prompt("You chose #{human.choice}.")
    sleep(0.75)
    prompt("#{computer.name} chose #{computer.choice}.")
    prompt(message('line'))
    sleep(0.75)
  end

  def display_result_player_wins
    prompt("#{human.choice} beats #{computer.choice}!")
    prompt(message('line'))
    sleep(0.7)
    prompt(message('round_win'))
  end

  def display_result_computer_wins
    prompt("#{computer.choice} beats #{human.choice}!")
    prompt(message('line'))
    sleep(0.7)
    prompt(message('round_loss'))
  end

  def display_result
    if human.won?(computer)
      display_result_player_wins
    elsif computer.won?(human)
      display_result_computer_wins
    else
      prompt(message('tie'))
    end
    prompt(message('line'))
    sleep(0.7)
    display_prompt_enter
  end

  def display_prompt_enter
    loop do
      prompt(message('enter'))
      entry = gets.chomp
      break if entry == ''
      prompt(message('invalid_entry'))
    end
  end

  def display_score
    prompt("Score -> #{human.score} : #{computer.score}")
  end

  def display_end_game_message
    prompt("Congratulations #{human.name}! You have won!") if human.score == 3
    prompt("Too bad #{human.name}...You have lost!") if computer.score == 3
    prompt(message('line'))
    sleep(0.75)
    prompt(message('end_game'))
  end
end

class Player
  attr_accessor :score

  def initialize
    @score = 0
  end
end

class Human < Player
  include FormattingInput

  attr_accessor :name, :choice

  def choose_option
    choice = ''
    loop do
      choice = gets.chomp
      break if valid_choice?(choice)
      prompt(message('invalid_choice'))
    end
    convert_answer(choice)
  end

  def won?(other)
    RPSGame::WINNING_RULES[choice].include?(other.choice)
  end

  private

  def convert_answer(choice)
    if choice.size == 1
      RPSGame::OPTIONS.each do |option|
        choice = option if option[0].downcase == choice.downcase
      end
    elsif choice.size == 2
      choice = 'Spock' if choice.downcase == 'sp'
      choice = 'Scissors' if choice.downcase == 'sc'
    end
    self.choice = choice.capitalize
  end

  def valid_choice?(choice)
    RPSGame::VALID_ANSWERS.include?(choice.downcase)
  end
end

class Computer < Player
  def won?(other)
    RPSGame::WINNING_RULES[choice.capitalize].include?(other.choice)
  end
end

class R2D2 < Computer
  attr_accessor :name, :choice

  def initialize
    @name = 'R2D2'
    super
  end

  def choose_option
    self.choice = (RPSGame::OPTIONS + ['Rock'] * 3).sample
  end
end

class C3PO < Computer
  attr_accessor :name, :choice

  def initialize
    @name = 'C3PO'
    super
  end

  def choose_option
    self.choice = (RPSGame::OPTIONS + ['Scissors'] * 3).sample
  end
end

class Terminator < Computer
  attr_accessor :name, :choice

  def initialize
    @name = 'Terminator'
    super
  end

  def choose_option
    self.choice = (RPSGame::OPTIONS + ['Spock'] * 3).sample
  end
end

class Robocop < Computer
  attr_accessor :name, :choice

  def initialize
    @name = 'Robocop'
    super
  end

  def choose_option
    self.choice = (RPSGame::OPTIONS + ['Paper'] * 3).sample
  end
end

class RPSGame
  include DisplayMessages
  include FormattingInput

  attr_reader :human, :computer

  OPTIONS = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
  VALID_ANSWERS = ['rock', 'paper', 'scissors', 'lizard',
                   'spock', 'r', 'p', 'sc', 'l', 'sp']
  WINNING_RULES = { 'Rock' => ['Scissors', 'Lizard'],
                    'Paper' => ['Spock', 'Rock'],
                    'Scissors' => ['Paper', 'Lizard'],
                    'Lizard' => ['Paper', 'Spock'],
                    'Spock' => ['Scissors', 'Rock'] }

  OPPONENTS = [R2D2.new, C3PO.new, Terminator.new, Robocop.new]

  def initialize
    @human = Human.new
    @computer = OPPONENTS.sample
  end

  private

  def prompt_name
    name = ''
    loop do
      prompt(message('name'))
      name = gets.chomp
      break if valid_name?(name)
      prompt(message('invalid_name'))
    end
    human.name = name.capitalize
  end

  def valid_name?(name)
    !name.strip.empty?
  end

  def calculate_score
    human.score += 1 if human.won?(computer)
    computer.score += 1 if computer.won?(human)
  end

  def clear
    sleep(1)
    (system 'clear') || (system 'cls')
  end

  def end_game?
    human.score == 3 || computer.score == 3
  end

  public

  def play
    prompt_name
    display_welcome
    display_rules
    loop do
      display_options
      human.choose_option
      computer.choose_option
      display_choices
      display_result
      calculate_score
      clear
      display_score
      break if end_game?
    end
    display_end_game_message
  end
end

game = RPSGame.new
game.play
