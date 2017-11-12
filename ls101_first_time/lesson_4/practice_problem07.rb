statement = "The Flintstones Rock"

def letter_freq(string)
  final_hash = {}
  letter_arr = string.delete(' ').chars.uniq
  letter_arr.each do |x|
    final_hash[x] = string.count x
  end
  final_hash
end

p letter_freq(statement)
