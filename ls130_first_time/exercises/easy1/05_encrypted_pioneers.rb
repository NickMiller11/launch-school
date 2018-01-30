=begin

The following list contains the names of individuals who are pioneers
in the field of computing or that have had a significant influence on
the field. The names are in an encrypted form, though, using a simple
(and incredibly weak) form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names.

input: string
output: string

rules:
- output a string with the letters of the input string all rotated by 13 characters

algorithm:
- create a hash with letters and position numbers
- initialize new array
- each_char
  - if char position number is above 13
    - subtract 13 and retrieve coorsponding char
  - else
    - add 13 and retrieve coorsponding char
  - push each retrieved char to new array

=end

# require 'pry'

# def decrypt(str)
#   counter = 1
#   alphabet_hash = {}
#   "a".upto("z") do |char|
#     alphabet_hash[char] = counter
#     counter += 1
#   end

#   decrypted_string = ""
#   str.downcase.each_char do |char|
#     #binding.pry
#     if char == ' '
#       decrypted_string << ' '
#     elsif alphabet_hash[char] <= 13
#       decrypted_string << alphabet_hash.key(alphabet_hash[char] + 13)
#     else
#       decrypted_string << alphabet_hash.key(alphabet_hash[char] - 13)
#     end
#   end
#   decrypted_string.split.map(&:capitalize!).join(' ')
# end

# p decrypt("Nqn Ybirynpr")
# p decrypt("Tenpr Ubccre")
# p decrypt("Nqryr Tbyqfgvar")

# Wow, my above solution is pretty convoluted.  I like the LS solution a lot more

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                          encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end