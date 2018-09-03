// Write a Function named octalToDecimal that performs octal to decimal conversion.
// When invoked on a String that contains the representation of an octal number,
// the Function returns a decimal version of that value as a Number. Implement the
// conversion yourself: do not use something else to perform the conversion for you.

// input - String
// output - numberString
//
// rules:
// - return a number that is the same number as the input but in octal
//
// algorithm:
// - create a var for exponent
// - split the string into an array
// - set exponent var equal to array length - 1
// - map the array to change each string into digit, multiply by 8 to exponent digit
//   - exponent -= 1
// - reduce the result

function octalToDecimal(numberString) {
  var exponent = numberString.length;

  return numberString.split('').map(function (digit) {
    exponent -= 1;
    return parseInt(digit, 10) * Math.pow(8, exponent);
  }).reduce(function (sum, currentDigit) {
    return sum += currentDigit;
  });
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
