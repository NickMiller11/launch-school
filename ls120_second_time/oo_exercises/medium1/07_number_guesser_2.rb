# Create an object-oriented number guessing class for numbers in the
# range 1 to 100, with a limit of 7 guesses per game.

class GuessingGame

  def initialize(min, max)
    @min = min
    @max = max
    @guesses = Math.log2(@max - @min).to_i + 1
    @answer = (@min..@max).to_a.sample
  end

  def play
    while @guesses > 0
      puts "You have #{@guesses} guesses remaining."
      num = ask_number
      case
      when num < @answer
        puts "Your guess is too low"
        @guesses -= 1
      when num > @answer
        puts "Your guess is too high"
        @guesses -= 1
      when num == @answer
        puts "You win!"
        break
      end
    end
    puts "You are out of guesses.  You lose." if @guesses <= 0
  end

  private

  def ask_number
    num = nil
    puts "Enter a number between #{@min} and #{@max}: "
    loop do
      num = gets.chomp.to_i
      break if num.between?(@min, @max)
      puts "Invalid guess.  Enter a number between 1 and 100: "
    end
    num
  end
end

game = GuessingGame.new(501, 1500)
game.play
