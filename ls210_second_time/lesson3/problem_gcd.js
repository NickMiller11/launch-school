// input - two integers
// output - one integer

// rule:
// - return the greatest common divisor of the two input numbers

// algorithm:
// - declare a variable for the divisor, set to the smaller of the two numbers
// - create a for loop, while the divisor is greater than 0
//   - return the divisor if the each of the input remainder divisor is 0
//   - decrement divisor by 1
// - return divisor

// function gcd(int1, int2) {
//   var divisor;
//   int1 > int2 ? divisor = int2 : divisor = int1;

//   for (; divisor > 0; divisor -= 1) {
//     if (int1 % divisor === 0 && int2 % divisor === 0) {
//       return divisor;
//     }
//   }

//   return divisor;
// }


// console.log(gcd(12, 4));   // 4
// console.log(gcd(15, 10));  // 5
// console.log(gcd(9, 2));    // 1

// Further exploration

// algorith:
// - declare a variable for the index
// - take the first two values and find their gcd
// - take the gcd and the next value and find their gcd
// - keep doing this until you reach the end of the array

function gcd(arr) {
  var index;
  var currentGcd = arr[0];

  for (index = 1; index < arr.length; index += 1) {
    var divisor;
    currentGcd > arr[index] ? divisor = arr[index] : divisor = currentGcd;

    for (; divisor > 0; divisor -= 1) {
      if (currentGcd % divisor === 0 && arr[index] % divisor === 0) {
        currentGcd = divisor;
        break;
      }
    }
  }

  return currentGcd;
}

console.log(gcd([25, 15, 105]))