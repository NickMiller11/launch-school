# Modify this program so it repeats itself after each input/print iteration,
# asking for a new number each time through. The program should keep running
# until the user enters q or Q.



loop do
  puts "How many times should we print out 'Launch School is the best!'? (At least 3," +
  "Q to quit)"
  input = gets.chomp


  loop do
    break if input.to_i >= 3 || break if input.downcase == 'q'
    puts "Please enter a positive integer greater than or equal to 3 (Q to quit)"
    input = gets.chomp
  end

  break if input.downcase == 'q'

  input.to_i.times do
    puts "Launch School is the best!"
  end
end
