// input - integer
// output - a block of integers and stars, where the top line is 1 followed by the
//         input integer number of stars, and the last line is all integers from 1
//         to the input integer

// rules:
// - input integer is greater than 1 and less than 10
// - log a combination of integers and stars to the console
// - for each successive log, the number of integers should increase by one and
//   number of stars should decrease by one

// algorithm:
// - declare a variable for the integers, assign to 1
// - declare a variable for the result string, set to 1 plus n - 1 repeat
//   number of stars
// - create a for loop - while integer variable is less than or equal to input
//   - set result string var to empty string
//   - add the integer to the result string
//   - add stars repeat input minus integer to result string
//   - console log the result string
//   - increment integer by one

function generatePattern(n) {
  var count;
  var numbers = '';
  var resultString = '';

  for (count = 1; count <= n; count += 1) {
    numbers += count;

    if (count < 9) {
      resultString = numbers + '*'.repeat(n - count);

      if (n > 9) {
        resultString = numbers + '*'.repeat(9 - count) + '**'.repeat(n - 9);
      }
    } else {
      resultString = numbers + '**'.repeat(n - count);
    }

    console.log(resultString);
  }
}


generatePattern(7);

// console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567

generatePattern(20);