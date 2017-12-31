module Displayable
  def clear_screen
    system("clear") || system("cls")
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to #{Hand::HAND_OPTIONS.join(', ').upcase}! "
    puts "The first player to win #{RPSGame::MAX_POINTS} points wins the game!"
    puts
  end

  def display_goodbye_message
    clear_screen
    puts "Thanks for playing #{Hand::HAND_OPTIONS.join(', ').upcase}. Goodbye!"
  end

  def display_choices
    clear_screen
    puts "#{human.name} chose: #{human.choice}"
    puts "#{computer.name} chose: #{computer.choice}"
  end

  def display_round_winner(winner)
    if winner
      puts "#{winner} won this round!"
    else
      puts "It's a tie!"
    end
  end

  def display_scoreboard
    puts "..........."
    puts "SCOREBOARD "
    puts "#{human.name.capitalize}: #{human.points}"
    puts "#{computer.name}: #{computer.points}"
    puts "..........."
  end

  def display_winner_all_rounds
    winner = winner_all_rounds
    if winner
      5.times do
        print " #{winner} is the winner of the game!".upcase
        sleep(0.5)
        print "\r"
        sleep(0.5)
      end
      clear_screen
    else
      clear_screen
      puts "No one won this game!"
    end
  end

  def computer_comments_on_outcome
    if winner_all_rounds == computer.name
      computer.say_something(computer.class::WIN_STATEMENTS)
    elsif winner_all_rounds == human.name
      computer.say_something(computer.class::LOSE_STATEMENTS)
    end
  end
end

class Player
  include Displayable
  attr_accessor :name, :points, :choice, :history

  def initialize
    @name = ''
    @points = 0
    @history = { won: [], lost: [], tie: [] }
  end

  def reset_history
    self.points = 0
    self.history = { won: [], lost: [], tie: [] }
  end

  def track_history(other_player, winner)
    hands = [choice.value, other_player.choice.value]

    if winner == name
      history[:won] << hands
    elsif winner == other_player.name
      history[:lost] << hands
    else
      history[:tie] << hands
    end
  end

  def display_history
    puts "#{name}'s history: "
    history.each_pair do |outcome, hands|
      hands.each do |hand|
        puts "#{hand[0]} => ".ljust(13) + outcome.to_s.rjust(5)
      end
    end
    puts
  end
end

class Human < Player
  def set_name
    input = name
    loop do
      puts "Enter your name: "
      input = gets.chomp.capitalize
      break if input =~ /\S/
      clear_screen
      puts "You must enter your name."
      sleep(0.8)
    end
    clear_screen
    self.name = input
  end

  def choose!
    clear_screen
    puts "Choose rock, paper, scissors, lizard, or Spock: "
    choice = nil

    loop do
      choice = gets.chomp.downcase
      break if Hand::HAND_OPTIONS.include?(choice)
      clear_screen
      puts "Enter a valid choice (rock, paper, scissors, lizard, or Spock): "
    end
    self.choice = Hand.new(choice)
  end
end

class Computer < Player
  WIN_STATEMENTS = ['The crowd goes wild!', 'Goooooooooooooooaaaaaallll!']
  LOSE_STATEMENTS = ['Win some, lose some.', 'That was a practice round!']

  def initialize
    super
    @name = ['President Camacho', 'Beef Supreme', 'Upgrayedd'].sample
  end

  def say_something(win_or_lose_statements)
    puts "#{name} says: #{win_or_lose_statements.sample}"
    puts
  end

  def choose!
    losing_choices = losing_choice_ratios
    random_hand = Hand::HAND_OPTIONS

    if losing_choices.any? { |_, ratio| ratio > 0.2 }
      choices =
        random_hand.map do |choice|
          if losing_choices[choice] <= 0.2
            [choice] * 2
          else
            choice
          end
        end
      self.choice = Hand.new(choices.flatten.sample)
    else
      self.choice = Hand.new(random_hand.sample)
    end
  end

  def losing_choice_ratios
    counts_hash = { 'rock' => 0, 'paper' => 0, 'scissors' => 0,
                    'lizard' => 0, 'spock' => 0 }

    return counts_hash if history[:lost].empty?

    losing_choices = []
    history[:lost].each do |hands|
      losing_choices << hands[0]
    end

    losing_choices.each do |hand|
      counts_hash[hand] = losing_choices.count(hand)
    end

    total = losing_choices.flatten.size

    counts_hash.each do |choice, count|
      counts_hash[choice] = (count.to_f / total)
    end
    counts_hash
  end
end

class Hillary < Computer
  WIN_STATEMENTS =
    ['Women are the largest untapped reservoir of talent in the world.',
     'There\'s a difference between fair game and playing games.']
  LOSE_STATEMENTS =
    ['I can\'t stand whining.',
     'I have a lot of stamina and I have a lot of resilience.']

  def initialize
    super
    @name = 'Hillary'
  end
end

class Donald < Computer
  WIN_STATEMENTS = ['I am the greatest!', 'This win is huge!']
  LOSE_STATEMENTS = ['It was rigged!', 'I won!']

  def initialize
    super
    @name = 'Donald'
  end

  def choose!
    choices =
      ["rock", "rock", "rock", "rock", "rock", "rock", "rock",
       "rock", "rock", Hand::HAND_OPTIONS.sample]

    self.choice = Hand.new(choices.sample)
  end
end

class Bernie < Computer
  WIN_STATEMENTS =
    ['I guess you could say I\'m the one percent.',
     'This win belongs to all of you.']
  LOSE_STATEMENTS =
    ['Difficult times often bring out the best in people.',
     'I\'m not always a smiley kind of guy.']

  def initialize
    super
    @name = 'Bernie'
  end

  def next_choice(current_choice)
    case current_choice
    when 'rock' then 'paper'
    when 'paper' then 'scissors'
    when 'scissors' then 'lizard'
    when 'lizard' then 'spock'
    when 'spock' then 'rock'
    end
  end

  def choose!
    choice = self.choice
    return self.choice = Hand.new('rock') if choice.nil?

    self.choice = Hand.new(next_choice(choice.value))
  end
end

class Hand
  HAND_OPTIONS = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_player)
    RPSGame::WINNING_COMBOS.include?([value, other_player.value])
  end

  def to_s
    value
  end
end

class RPSGame
  include Displayable

  MAX_POINTS = 5

  WINNING_COMBOS =
    [
      ['rock', 'scissors'], ['rock', 'lizard'],
      ['scissors', 'paper'], ['scissors', 'lizard'],
      ['paper', 'rock'], ['paper', 'spock'],
      ['lizard', 'spock'], ['lizard', 'paper'],
      ['spock', 'rock'], ['spock', 'scissors']
    ]

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = [Computer.new, Hillary.new, Donald.new, Bernie.new].sample
  end

  def play
    display_welcome_message
    human.set_name

    loop do
      loop do
        play_round
        break if winner_all_rounds || play_next_round == 'q'
      end
      display_winner_all_rounds
      computer_comments_on_outcome
      see_history
      break unless play_again?
      reset_history
    end

    display_goodbye_message
  end

  private

  def play_round
    human.choose!
    computer.choose!
    display_choices
    winner = who_won_round
    display_round_winner(winner)
    track_points
    human.track_history(computer, winner)
    computer.track_history(human, winner)
    display_scoreboard
  end

  def who_won_round
    if human.choice > computer.choice
      human.name
    elsif computer.choice > human.choice
      computer.name
    end
  end

  def track_points
    winner = who_won_round

    if winner == human.name
      human.points += 1
    elsif winner == computer.name
      computer.points += 1
    end
  end

  def winner_all_rounds
    if human.points >= MAX_POINTS
      human.name
    elsif computer.points >= MAX_POINTS
      computer.name
    end
  end

  def see_history
    puts "Enter 'h' to see game history. Enter any other key to continue."
    input = gets.chomp.downcase

    if input == 'h'
      clear_screen
      human.display_history
      computer.display_history
      puts "Enter any key to continue."
      gets
    end

    clear_screen
  end

  def play_next_round
    puts "Press enter to continue to next round. Press 'q' to quit: "
    gets.chomp.downcase
  end

  def reset_history
    human.reset_history && computer.reset_history
  end

  def play_again?
    input = nil
    loop do
      puts "Do you want to play a new game? ('y' or 'n'): "
      input = gets.chomp.downcase
      break if ['n', 'y'].include?(input)
      clear_screen
      puts "Please enter either 'y' or 'n'."
    end
    clear_screen
    input == 'y'
  end
end

RPSGame.new.play
