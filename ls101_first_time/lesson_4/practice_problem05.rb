flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |x| x.start_with?("Be") }

def get_be(family_data)
  counter = 0


  loop do
    current_name = family_data[counter]
    if current_name.start_with?("Be")
      puts family_data.index(current_name)
      break
    end
    counter += 1
  end
end

p get_be(flintstones)
