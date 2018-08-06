
// input: positive integer
// output: string of 1's and 0's

// rules: output a string of alternativing 1's and 0's, starting on 1
//       the length of the output should match the length of the string

// pseudo code:
// - declare a variable for final string
// - while the final string length is less than input number
//   - add a 1 if length is even, and add a 0 if length is odd
// - return final string

function stringy(int) {
  var finalString = '';

  while (finalString.length < int) {
    if (finalString.length % 2 === 0) {
      finalString += '1';
    } else {
      finalString += '0';
    }
  }

  return finalString;
}


console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"