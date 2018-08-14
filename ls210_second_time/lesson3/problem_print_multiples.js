// input: integer between 0 and 100
// output: integers logged to console

// rules
// - log all integers between 0 and 100(inclusive) that are multiples of input
// - log integers in descending order

// algorithm:
// - declare a variable for number and set equal to 100
// - create a for loop for while variable is greater than 0
//   - if number remainer input is 0 and odd , log the number
//   - decrement number by 1

// function logMultiples(int) {
//   var number;
//   for (number = 100; number > 1; number -= 1) {
//     if (number % int === 0 && number % 2 === 1) {
//       console.log(number);
//     }
//   }
// }

// logMultiples(17);
// logMultiples(21);

// further exploration

function logMultiples(int) {
  var number = Math.floor(100 / int) * int
  for (; number > 0; number -= int) {
    if (number % 2 === 1) {
      console.log(number);
    }
  }
}

logMultiples(17);
logMultiples(21);