
=begin

Input: guesses from user
Output: text directing user

Rules:
- user tries to guess a number between 1 and 100
- the user has 7 guesses
- the user is warned if they input an invalid number
- let the user know if they win or lose

=end

class GuessingGame
  TOTAL_GUESSES = 7
  MIN_NUMBER = 1
  MAX_NUMBER = 100

  def initialize
    @num_of_guesses = TOTAL_GUESSES
    @winning_num = (MIN_NUMBER..MAX_NUMBER).to_a.sample
    @current_guess = nil
  end

  def play
    loop do
      guesses_remaining
      game_prompt
      guess_check
      break if win?
      subtract_guesses
      out_of_guesses?
      break if lose?
    end
  end

  private

  def guesses_remaining
    puts "You have #{@num_of_guesses} guesses remaining."
  end


  def game_prompt
    puts "Enter a number between #{MIN_NUMBER} and #{MAX_NUMBER}: "
    @current_guess = gets.chomp.to_i
  end

  def guess_check
    case @current_guess <=> @winning_num
    when -1
      puts "Your guess is too low"
    when 1
      puts "Your guess is too high"
    when 0
      puts "You win!"
    end
  end

  def win?
    @current_guess == @winning_num
  end

  def subtract_guesses
    @num_of_guesses -= 1
  end

  def out_of_guesses?
    puts "You are out of guesses. You lose." if @num_of_guesses == 0
  end

  def lose?
    @num_of_guesses == 0
  end


end

game = GuessingGame.new
game.play
