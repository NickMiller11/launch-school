ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843,
         "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# def age_total(family_data)
#   counter = 0
#   total_ages = 0
#   names = family_data.keys
#
#   loop do
#     break if counter == names.size
#     name = names[counter]
#     age = family_data[name]
#
#     total_ages += age
#
#     counter += 1
#   end
#   total_ages
# end

# p age_total(ages)

def age_total(family_data)
  total_ages = 0

  family_data.each do |key, value|
    total_ages +=  value
  end

  total_ages
end

p age_total(ages)
