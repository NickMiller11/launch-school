# Write a program that cleans up user-entered phone numbers so that
# they can be sent as SMS messages.

# The rules are as follows:

# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1,
#   trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1,
#   then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number

=begin

number method:
input - None
output - string of phone number with all non-decimal digit chars removed

rules
- return a string of all non-decimal digits removed
- return all 0's if there are letters in the number
- return all 0's if less than 10 characters
- return all 0's if number is l1 chars and first number is 1
- return all 0's if number is more than 11 chars
- return number with first 1 removed if 11 chars and first is 1

algorithm
- use gsub regex to remove any non-alphabetic, non-decimal characters
  - if new number is less than 10, greater than 11, 11 and first is not 1, or
    inclues letters, return all 0's
  - if 11 chars and first one is 1, strip 1
- return result

area_code method
input:
output:

rules:

algorithm:

to_s method

=end

class PhoneNumber
  INVALID = '0000000000'

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    return INVALID if @phone_number.match(/[a-z]/i)
    @phone_number.gsub!(/[\W]|/, '')
    return INVALID if invalid?

    @phone_number.size == 10 ? @phone_number : @phone_number[1..-1]
  end

  def invalid?
    @phone_number.size > 11 ||
    @phone_number.size < 10 ||
    (@phone_number.size == 11 && @phone_number.chr != '1')
  end 

  def area_code
    @phone_number[-10..-8]
  end

  def middle_three_digits
    @phone_number[-7..-5]
  end

  def last_four_digits
    @phone_number[-4..-1]
  end

  def to_s
    "(#{area_code}) #{middle_three_digits}-#{last_four_digits}"
  end
end

############ Original Refactored Solution ################

# class PhoneNumber

#   def initialize(phone_number)
#     @phone_number = phone_number
#   end

#   def number
#     @phone_number.gsub!(/[\W]|/, '')

#     if @phone_number.size == 10 && !@phone_number.match(/[\D]/)
#       @phone_number
#     elsif @phone_number.size == 11 && @phone_number.chr == '1'
#       @phone_number[1..-1]
#     else
#       '0000000000'
#     end
#   end

#   def area_code
#     @phone_number[-10..-8]
#   end

#   def middle_three_digits
#     @phone_number[-7..-5]
#   end

#   def last_four_digits
#     @phone_number[-4..-1]
#   end

#   def to_s
#     "(#{area_code}) #{middle_three_digits}-#{last_four_digits}"
#   end
# end
