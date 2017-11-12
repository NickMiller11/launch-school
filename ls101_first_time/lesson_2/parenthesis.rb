require "pry"

def balancer(string)
  counter_left = 0
  counter_right = 0
  string.each_char do |char|
    counter_left += 1 if char == "("
    counter_right += 1 if char == ")"
  end
  p counter_left == counter_right
end

balancer("h((ell))o")
