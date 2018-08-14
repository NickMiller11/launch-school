// input: positive integer
// output: log all odd numbers from 1 to input number (inclusive)

// rules:
// - all numbers should be logged on separate lines

// algorithm:
// - declare a var for number
// - create a for loop starting at 0
//   - if the remainder of dividing the number by 2 is 0, log it
//   - else continue to the next number
// - stop the for loop once the number has reached the input number

// function logOddNumbers(int) {
//   var num;

//   for (num = 0; num <= int; num += 1) {
//     if (num % 2 !== 0) {
//       console.log(num);
//     }
//   }
// }

// logOddNumbers(19);

//further exploration1

// function logOddNumbers(int) {
//   var num;

//   for (num = 1; num <= int; num += 2) {
//     console.log(num)
//   }
// }

logOddNumbers(19);

//further exploration2

function logOddNumbers(int) {
  var num;

  for (num = 0; num <= int; num += 1) {
    if (num % 2 === 0) {
      continue;
    }

    console.log(num);
  }
}