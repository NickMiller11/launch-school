flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = flintstones.each_with_object({}) do |val, h|
  h[val] = flintstones.index(val)
end

p flintstones_hash
