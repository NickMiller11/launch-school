// input - string
// output - string
//
// rules:
// - if the character is an alphabetic character, change it to a character 13 positions
//   later in the alphabet
// - if you reach the end of the alphabet, return to the beginning
// - preserve case in the transformation
// - do not modify characters that are not letters
//
// algorithm:
// - declare a variable for newstring and set to empty string
// - declare a variable for index
// - create a for loop (while index is less than string.length)
//   - check to see if characters ascii code is between 65 and 77
//     - if so, add 13 to the code and convert back to character
//     - concat char to new string
//   - check to see if characters ascii code is between 78 and 90
//     - if so, subtract 13 to the code and convert back to character
//     - concat char to new string
//   - check to see if characters ascii code is between 97 and 109
//     - if so, add 13 to the code and covert back to character
//     - concat char to new string
//   - check to see if characters ascii code is between 110 and 122
//     - if so, subtract 13 to the code and convert back to acharater
//     - concat char to new string
//   - else
//     - concat char to new string
// - return new string

function addToAscii(asciiNumeric) {
  return asciiNumeric += 13;
}

function subtractFromAscii(asciiNumeric) {
  return asciiNumeric -= 13;
}

function rot13(string) {
  var i;
  var newString = '';
  var LOWER_A = 'a'.charCodeAt();
  var LOWER_M = 'm'.charCodeAt();
  var LOWER_N = 'n'.charCodeAt();
  var LOWER_Z = 'z'.charCodeAt();
  var UPPER_A = 'A'.charCodeAt();
  var UPPER_M = 'M'.charCodeAt();
  var UPPER_N = 'N'.charCodeAt();
  var UPPER_Z = 'Z'.charCodeAt();


  for (i = 0; i < string.length; i += 1) {
    asciiNumeric = string.charCodeAt(i);
    currentChar = string[i];

    if ((asciiNumeric >= LOWER_A && asciiNumeric <= LOWER_M) ||
      (asciiNumeric >= UPPER_A && asciiNumeric <= UPPER_M)) {
      asciiNumeric = addToAscii(asciiNumeric);
    } else if ((asciiNumeric >= LOWER_N && asciiNumeric <= LOWER_Z) ||
      (asciiNumeric >= UPPER_N && asciiNumeric <= UPPER_Z)) {
      asciiNumeric = subtractFromAscii(asciiNumeric);
    }

    currentChar = String.fromCharCode(asciiNumeric);
    newString += currentChar;
  }

  return newString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
