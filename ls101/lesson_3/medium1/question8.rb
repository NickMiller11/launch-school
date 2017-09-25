require "pry"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash_clone = demo_hash.clone
  demo_hash_clone.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa
# could stop him, he hit the Enter key with his tail:

p munsters
puts ' '
p mess_with_demographics(munsters)
puts ' '
p munsters

# I don't think this will change the munsters hash because the methods called
# on it are non-mutative

# Oops!  I was wrong!  It looks like the object_id of the munsters hash was passed
# in to the demo_hash.  If we would have reassigned the demo_hash, then the
# munsters hash data would have been safe, but the method changed the object that
# the munsters variable was pointed to.  It looks like even though these are non-mutative
# methods, because they are effecting the values of the hash, they are still mutated
# (or more aptly said, they are reassigned to a different value within the same object)

# So how would I go about changing the code so that munsters isn't mutated?
