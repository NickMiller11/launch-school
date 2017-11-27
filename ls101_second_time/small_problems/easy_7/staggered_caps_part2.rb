# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.

def staggered_case(str) # moving to new string
  capital_letter = true
  new_str = ''
  str.each_char do |letter|
    if letter =~ /[^a-z]/i
      new_str << letter
    else
      capital_letter ? letter.upcase! : letter.downcase!
      new_str << letter
      capital_letter = !capital_letter
    end
  end
  new_str
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
