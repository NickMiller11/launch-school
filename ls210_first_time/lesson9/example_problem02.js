// input - string
// output - boolean

// rules:
// - check to see if input string is a valid per Luhn formula
//   - from the rightmost digit, double every second digit
//   - if doubled number is more than 9, subtract by 9
//   - add all digits together
//   - if sum is a multiple of 10, then number is valid
// - ignore any non-numeric characters

// algorithm:
// - iterate over a cleaned up array to put together the test number
//   - clean up number string by removing anything not a digit
//   - split string into array
//   - iterate through cleaned up number array starting from arr.length - 1
//     - change string chars to numbers
//     - double if index is odd and subtract 9 if more than 10
// - sum the test number to see if it is valid

function isValidNumber(numberString) {
  var cleanedArray;
  var newArray;
  var sum;

  cleanedArray = numberString.replace(/\D/g, '').split('');
  newArray = applyLuhnFormula(cleanedArray);

  sum = newArray.reduce(function (total, value) {
    return total + value;
  },0);

  return sum % 10 === 0;
}

function applyLuhnFormula(array) {
  var change = false;
  var returnArray = [];
  var i;

  for (i = array.length - 1; i >= 0; i -= 1) {
    digit = parseInt(array[i], 10);

    if (change) {
      digit *= 2;

      if (digit >= 10) {
        digit -= 9;
      }
    }

    returnArray.unshift(digit);
    change = !change;
  }

  return returnArray;
}

console.log(isValidNumber("2323 2005 7766 3554"));
console.log(isValidNumber("9204625339946807"));
console.log(isValidNumber("1111"));
console.log(isValidNumber("8763"));