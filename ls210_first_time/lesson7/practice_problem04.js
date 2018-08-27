// input - string
// output - number

// rules:
// - return a decimal version of the input string as a number

// algorithm:
// - split the string into digits
// - use map to transform the digit into decimal form
// - reduce and sum up the transformed digits

function octalToDecimal(numberString) {
  var numArray = numberString.split('').reverse();

  var conversion = numArray.map(function (digit, index) {
    return digit * Math.pow(8, index);
  });

  return conversion.reduce(function (sum, digit) {
    return sum + digit;
  });
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9