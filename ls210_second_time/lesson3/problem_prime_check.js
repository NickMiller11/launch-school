// input - number
// output - boolean

// rules - return true if the input number is prime, false otherwise

// algorithm -
// - declare a variable for number and set equal to input / 2
// - create a for loop - while number is greater than 1
//   - check to see if the input is divisible by number
//     - if so, return false
//   - decrement number by 1
// - return true

// function isPrime(int) {
//   var number = Math.floor(int / 2);

//   if (int <= 1 || int % 2 === 0) {
//     return false;
//   }

//   for (; number > 1; number -= 1) {
//     if (int % number === 0) {
//       return false;
//     }
//   }

//   return true;
// }

// LS Further exploration solution

function isPrime(int) {
  if (int <= 1 || (int > 2 && int % 2 === 0)) {
    return false;
  }

  var divisor;

  for (divisor = 3; divisor < int / 2; divisor += 2) {
    if (int % divisor === 0) {
      return false;
    }
  }

  return true;
}

console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false