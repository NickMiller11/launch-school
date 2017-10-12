
LETTERS_NUMBERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0)

def uuid
  first = LETTERS_NUMBERS.sample(8).join
  second = LETTERS_NUMBERS.sample(4).join
  third = LETTERS_NUMBERS.sample(4).join
  fourth = LETTERS_NUMBERS.sample(4).join
  fifth = LETTERS_NUMBERS.sample(12).join
  puts("#{first}-#{second}-#{third}-#{fourth}-#{fifth}")
end

uuid
