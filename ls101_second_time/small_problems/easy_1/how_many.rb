# Write a method that counts the number of
# occurrences of each element in a given array.
#
vehicles = ['car', 'car', 'truck', 'car', 'SUV',
  'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
#
# count_occurrences(vehicles)
#
# Once counted, print each element alongside the number of occurrences.
#
# Expected output:
#
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

=begin

input: array
output: hash

Rules:
- hash values are the number of times the key appears in the input array

Algorithm:
- create a new hash
- iterate over the array and store the array objects in the hash as keys
- if the key exists, add one to the values

- crate a new hash that is uniq version of the input array
- iterate over the new hash, using count for the value in the input array
- push values to new hash

=end

def count_occurrences1(arr)
  result_hash = {}
  arr.each do |vehicle|
    if result_hash.key?(vehicle)
      result_hash[vehicle] += 1
    else
      result_hash[vehicle] = 1
    end
  end
  result_hash
end

def count_occurrences2(arr)
  result_hash = {}
  unique_arr = arr.uniq
  unique_arr.each do |vehicle|
    result_hash[vehicle] = arr.count(vehicle)
  end
  result_hash
end

p count_occurrences1(vehicles)
p count_occurrences2(vehicles)
