// input - number
// output - negative number

// rules:
// - if the number is a negative number, return as is
// - if the number is a positive number, return it as a negative number

// algorithm:
// - use abs to change the input into a positive number and multiply by -1


function negative(num) {
  return Math.abs(num) * -1
}

console.log(negative(5));     // -5
console.log(negative(-3));    // -3
console.log(negative(0));     // -0