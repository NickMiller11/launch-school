
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

  def initialize(min, max)
    @min = min
    @max = max
    @num_of_guesses = Math.log2(max-min).to_i + 1
    @winning_num = (@min..@max).to_a.sample
    @current_guess = nil
  end

  def play
    loop do
      print_remaining_guesses
      guess_check
      guess_comparison
      break if win?
      subtract_guesses
      out_of_guesses?
      break if lose?
    end
  end

  private

  def print_remaining_guesses
    puts "You have #{@num_of_guesses} guesses remaining."
  end

  def guess_check
    puts "Enter a number between #{@min} and #{@max}: "
    loop do
      @current_guess = gets.chomp.to_i
      break if (@min..@max).cover?(@current_guess)
      puts "Invalid guess. Enter a number between #{@min} and #{@max}"
    end
  end

  def guess_comparison
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

game = GuessingGame.new(501,1500)
game.play
