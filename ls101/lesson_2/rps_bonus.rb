require "pry"

VALID_CHOICES = %w(rock paper scissors lizard spock)
ABBREVIATED_CHOICES = {"r" => "rock",
                       "p" => "paper",
                       "s" => "scissors",
                       "l" => "lizard",
                       "k" => "spock"}

def prompt(message)
  Kernel.puts("=> #{message}")
end

# def win?(first, second)
#   (first == 'rock' && second == 'scissors') ||
#     (first == 'paper' && second == 'rock') ||
#     (first == 'scissors' && second == 'paper') ||
#     (first == 'lizard' && second == 'paper') ||
#     (first == 'spock' && second == 'rock') ||
#     (first == 'lizard' && second == 'spock') ||
#     (first == 'rock' && second == 'lizard') ||
#     (first == 'spock' && second == 'scissors') ||
#     (first == 'paper' && second == 'spock') ||
#     (first == 'scissors' && second == 'lizard')
# end

def win?(first, second)
  winning_combos = {'rock' => ['scissors', 'lizard'],
                    'paper' => ['rock', 'spock'],
                    'scissors' => ['paper', 'lizard'],
                    'lizard' => ['paper', 'spock']
                    'spock' => ['rock', 'scissors']}
                    

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# def change_score(player, computer)
#   if win?(player, computer)
#     player_wins += 1
#   elsif win?(computer, player)
#     computer_wins += 1
#   end
# end

def display_score(player, computer)
  if player == 5
    prompt("Player won the game!!")
  elsif computer == 5
    prompt("Computer won the game!!")
  else
    prompt("Current score in the game to 5 wins")
    prompt("Player: #{player}")
    prompt("Computer: #{computer}")
  end
end

prompt("Welcome to our Rock, Paper, Scissors, Lizard, Spock game.")
prompt("Each game is a game to 5 wins.")

loop do # main loop
  computer_wins = 0
  player_wins = 0

  loop do
    choice = ''

    loop do
      prompt("Choose one: #{ABBREVIATED_CHOICES.keys.join(', ')} for #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(ABBREVIATED_CHOICES[choice])
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{ABBREVIATED_CHOICES[choice]}; Computer chose: #{computer_choice}")

    display_results(ABBREVIATED_CHOICES[choice], computer_choice)


    if win?(ABBREVIATED_CHOICES[choice], computer_choice)
      player_wins += 1
    elsif win?(computer_choice, ABBREVIATED_CHOICES[choice])
      computer_wins += 1
    end

    display_score(player_wins, computer_wins)
    break if player_wins == 5 || computer_wins == 5

  end
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thank you for playing, goodbye!")
