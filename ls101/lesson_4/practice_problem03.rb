ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# def younguns(family_data)
#
#   family_data.reject! { |k,v| v > 100 }
#
# end

# def younguns(family_data)
#   counter = 0
#   names = family_data.keys
#
#   loop do
#     break if counter == names.size
#
#     name = names[counter]
#     age = family_data[name]
#
#     family_data.delete(name) if age > 100
#
#     counter += 1
#   end
#   family_data
# end

# def younguns(family_data)
#   family_data.select do |k, v|
#     family_data.delete(k) if v > 100
#   end
#   family_data
# end

def younguns(family_data)
  family_data.keep_if { |_, age| age < 100 }
end

p younguns(ages)
