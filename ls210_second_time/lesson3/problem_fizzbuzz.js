// input - nothing
// output - integers and strings logged to console

// rules
// - iterate over all integers between 1 and 100 inclusive
// - if the number is divisible by 3, log 'Fizz'
// - if the number is divisible by 5, log 'Buzz'
// - if the number is divisible by 3 and 5, log 'FizzBuzz'
// - for all other numbers, log the number

// algorithm:
// - declare a variable and set to 1
// - create a while loop for while number is less than or equal to 100
//   - if the number is divisible by 3 and 5, log 'FizzBuzz'
//   - if the number is divisible by 3, log 'Fizz'
//   - if the number is divisible by 5, log 'Buzz'
//   - else, log the number
//   - increment number by 1

function fizzbuzz() {
  var num = 1;
  while (num <= 100) {
    if (num % 3 === 0 && num % 5 === 0) {
      console.log('FizzBuzz');
    } else if (num % 3 === 0) {
      console.log('Fizz');
    } else if (num % 5 === 0) {
      console.log('Buzz');
    } else {
      console.log(num);
    }

    num += 1;
  }
}

fizzbuzz();