// input -
// output -
//
// rules:
// - if the ASCII code for a character in the input string is between 65 and 90,
//   add 32 to the number
// - do not change the character if it is not an uppercase alphabetic character
//
// algorithm:
// - declare a variable for the return string
// - declare an index variable
// - create a for loop (while the index is less than the string lenght)
//   - if the character at that indexs ASCII code is between 65 and 90
//     - add 32 to the code and convert it back to a character
//     - concatenate that character onto the return string
//   else
//     - concatenate that character onto the return string
// - return the return string

function toLowerCase(string) {
  var i;
  var returnStr = '';
  var asciiNumeric;

  for (i = 0; i < string.length; i += 1) {
    asciiNumeric = string.charCodeAt(i)

    if (asciiNumeric >= 65 && asciiNumeric <= 90) {
      asciiNumeric += 32;
      returnStr += String.fromCharCode(asciiNumeric);
    } else {
      returnStr += string[i];
    }
  }

  return returnStr;
}

console.log(toLowerCase('ALPHABET'));
console.log(toLowerCase('123'));
console.log(toLowerCase('abcDEF'));
