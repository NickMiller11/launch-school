# Write a method that takes a first name, a space, 
# and a last name passed as a single String argument, 
# and returns a string that contains the last name, 
# a comma, a space, and the first name.

def swap_name(full_name)
  arr = full_name.split
  arr[1] += ','
  arr[0], arr[1] = arr[1], arr[0]
  arr.join(' ')
end

def swap_name_ls(full_name)
  full_name.split.reverse.join(', ')
end


p swap_name('Joe Roberts') == 'Roberts, Joe'

p swap_name_ls('Joe Roberts') == 'Roberts, Joe'