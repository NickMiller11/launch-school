# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field.
# The names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

# Write a program that deciphers and prints each of these names.

=begin

input: string
output: string

rules:
- rotate letter thirteen spaces
- ignore spaces
- print decrypted name

algorithm:
- split the string by spaces into an array
- iterate over each word
- iterate over each letter
- if letter is a-m or A-M, add 13 to the ord value
- if letter is n-z or N-Z, subtract 13 from the ord value
- use chr to turn back into a letter
- ignore spaces, punctuation
=end

# def decrypt(encrypted_name)
#   name = encrypted_name.chars
#   decrypted_name = []

#   name.each do |letter|

#     case letter

#     when /[a-m]/i
#       decrypted_name << (letter.ord + 13).chr
#     when /[n-z]/i
#       decrypted_name << (letter.ord - 13).chr
#     else
#       decrypted_name << letter
#     end

#   end

#   decrypted_name.join("")
# end

# LS Solution


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

# p decrypt("Nqn Ybirynpr")
# p decrypt("Tenpr Ubccre")
# p decrypt("Nqryr Tbyqfgvar")
# p decrypt("Nyna Ghevat")
# p decrypt("Puneyrf Onoontr")
# p decrypt("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
# p decrypt("Wbua Ngnanfbss")
# p decrypt("Ybvf Unvog")
# p decrypt("Pynhqr Funaaba")
# p decrypt("Fgrir Wbof")
# p decrypt("Ovyy Tngrf")
# p decrypt("Gvz Orearef-Yrr")
# p decrypt("Fgrir Jbmavnx")
# p decrypt("Xbaenq Mhfr")
# p decrypt("Fve Nagbal Ubner")
# p decrypt("Zneiva Zvafxl")
# p decrypt("Lhxvuveb Zngfhzbgb")
# p decrypt("Unllvz Fybavzfxv")
# p decrypt("Tregehqr Oynapu")