
// input: string
// output: string with non-alphabetic char replaced by spaces

// rules:
//   - replace any non-alphabetic chars in input with spaces
//   - if more than one consecutive non-alpha char is there, replace with only one space

// pseudo code:
//   - iterate through the string
//   - if the current char is a non-alpha char and next is alpha char, add space to final string
//   - if the current char and next char is non-alpha char, continue to next char
//   - if the current char is an alpha char, add to final string

function alphaChar(char) {
  return char >= 'a' && char <= 'z';
}

function cleanUp(str) {
  var i
  var finalStr = '';

  for (i = 0; i < str.length; i++) {
    if (alphaChar(str[i])) {
      finalStr += str[i];
    } else if (!alphaChar(str[i]) && alphaChar(str[i + 1])) {
      finalStr += ' ';
    } else {
      continue;
    }
  }

  return finalStr;
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "