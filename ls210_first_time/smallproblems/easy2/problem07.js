
// input: integer
// output: integer

// rules:
// - return an integer that is double the value of the input unless the input
//   number is an even-length number where the digits in the first half of the number
//   are the same as the second half.

// pseudo code:
// - declare a variable for the number as a string
// - turn the number into a string.
// - Use the length to determine if the first half is equal to the second half
//   - if so, return the number
//   - if not, double and return the number

function calcHalf(str, start, end) {
  var finalStr = '';

  for (; start <= end; start++) {
    finalStr += str[start];
  }

  return finalStr;
}


function twice(num) {
  var numberStr = num.toString();
  var halfIndex = numberStr.length/2 - 1
  var firstHalf = calcHalf(numberStr, 0, halfIndex);
  var secondHalf = calcHalf(numberStr, halfIndex + 1, numberStr.length - 1);

  if (numberStr.length % 2 === 0 && firstHalf === secondHalf ) {
    return num;
  } else {
    return num * 2;
  }
}


console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676