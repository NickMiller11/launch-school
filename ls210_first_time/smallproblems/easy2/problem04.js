
// input: integer
// output: integer

// rules:
// - return the first number that has the number of digits specified by the input
// - input is always equal to or greater than 2

// pseudo-code:
// - declare a variable for i
// - declare a variable for previous 1st number
// - declare a variable for previous 2nd number
// - declare a variable for current number
// - declare a variable for temp number

// - while the length of the current number (after converting to string) is less than
//   i
//   - temp equals current number
//   - current number equals the previous 1st plus previous 2nd.
//   - previous 2 equals previous 1
//   - previous 1 equals temp

// - return i

// number.toString().length

function findFibonacciIndexByLength(int) {
  var i
  var currentNum = 2;
  var previousNum1 = 1;
  var previousNum2 = 1;

  for (i = 2; currentNum.toString().length < int; i++) {
    previousNum2 = previousNum1;
    previousNum1 = currentNum;
    currentNum = previousNum1 + previousNum2;
  }

  return i + 1;
}


console.log(findFibonacciIndexByLength(2));       // 7
console.log(findFibonacciIndexByLength(10));      // 45
console.log(findFibonacciIndexByLength(16));      // 74