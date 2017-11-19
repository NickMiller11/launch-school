VALID_CHOICES = %w((r)ock (p)aper (s)cissors (l)izard (sp)ock)
COMPUTER_CHOICES = %w(r p s l sp)

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

def display_score(player, computer)
  prompt("Player score: #{player}, Computer score: #{computer}")
end

def convert_choice(player)
  case player
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  else
    'spock'
  end
end

player_wins = 0
computer_wins = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.each { |selection| selection[0..3].include?(choice) }
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = COMPUTER_CHOICES.sample

  puts("You chose: #{convert_choice(choice)};" +
       " Computer chose: #{convert_choice(computer_choice)}")

  display_results(convert_choice(choice), convert_choice(computer_choice))

  case
  when win?(convert_choice(choice), convert_choice(computer_choice))
    player_wins += 1
  when win?(convert_choice(computer_choice), convert_choice(choice))
    computer_wins += 1
  end

  display_score(player_wins, computer_wins) # need to create this method
  if player_wins == 5
    prompt("The player is the grand winner!")
    break
  elsif computer_wins == 5
    prompt("The computer is the grand winner!")
    break
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y') || (player_wins == 5 || computer_wins == 5)
end

prompt("Thank you for playing. Good bye!")
