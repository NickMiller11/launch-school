# Typically meetups happen on the same day of the week.
#
# Examples are
#
# the first Monday
# the third Tuesday
# the Wednesteenth
# the last Thursday
#
# Note that "Monteenth", "Tuesteenth", etc are all made up words.
# There was a meetup whose members realised that there are exactly 7
# days that end in '-teenth'. Therefore, one is guaranteed that each
# day of the week (Monday, Tuesday, ...) will have exactly one date
# that is named with '-teenth' in every month.
#
# Write code that calculates date of meetups.

=begin

input: symbol for weekday, symbol for position of weekday in month
output: date object with year, month, day

rules:
- Take in the month and year as ivars for the Meetup object
- Take in weekday and position of weekday in month as parameters to day method
- Calculate the exact date given this information
- Return a Date object with calculated exact date
- if the position of the weekday in month is :teenth, return day of week modified
  with "teenth" on the end (example: Wednesteenth)

algorithm:
- calculate range of week
  - first = 1-7
  - second = 8-14
  - teenth = 13-19
  - third = 15-21
  - fourth = 22-29
  - fifth = 30-31
  - last = somewhere between 22-28 and 25-31

=end

require 'date'

class Meetup
  DAYS_OF_WEEK = Date::DAYNAMES

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)

  end


end

Meetup.new(5, 2013).day(:monday, :teenth)
