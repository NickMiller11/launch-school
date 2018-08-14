// input - nothing
// output - log all multiples of 3 and 5

// rules
// - log all multiples of 3 and 5 between 1 and 100 (inclusive)
// - if the number isa  multiple of both 3 and 5, add a ! to the end of the number

// algorithm
// - declare a variable for number and set equal to 1
// - create a while loop for when number is less than or equal to 100
//   - log number with a bang at end if divisible by 3 and 5
//   - log number if divisible by 3 or 5

// function multiplesOfThreeAndFive() {
//   var num = 1;
//   while (num <= 100) {
//     if (num % 3 === 0 && num % 5 === 0) {
//       console.log(num.toString() + '!');
//     } else if (num % 3 === 0 || num % 5 === 0) {
//       console.log(num.toString());
//     }

//     num += 1;
//   }
// }

// multiplesOfThreeAndFive();

// further exploration

// algorithm
// - declare a variable for number and set equal to beginning number
// - create a while loop for when number is less than or equal to end number
//   - log number with a bang at end if divisible by 3 and 5
//   - log number if divisible by 3 or 5

function multiplesOfThreeAndFive(start, end) {
  var num = start;
  while (num <= end) {
    if (num % 3 === 0 && num % 5 === 0) {
      console.log(num.toString() + '!');
    } else if (num % 3 === 0 || num % 5 === 0) {
      console.log(num.toString());
    }

    num += 1;
  }
}

multiplesOfThreeAndFive(1, 15);