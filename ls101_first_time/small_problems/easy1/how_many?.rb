

# input - array of elements
# output - element, rocket arrow, number of times the element occured
# what should I do if it's an empty array => return nothing

# test case 1: ['boy', 'girl', 'bike', fork']

# boy => 1
# girl => 1
# bike => 1
# fork => 1

# test case 2: ['boy', 'boy', 'boy']  =>  boy => 3

# test case 3: []  => return nothing

# data structure
# input - array
# output - hash


# set the unique values in the array as keys to a new hash.
# set how many times they occur as the values
# print the hash

def count_occurances(vehicles)
  vehicles_uniq = vehicles.uniq
  vehicles_uniq.each do |element|
    puts "#{element} => #{vehicles.count(element)}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
count_occurances(vehicles)
