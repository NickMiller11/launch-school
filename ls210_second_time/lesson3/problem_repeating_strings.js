// input - string, second argument
// output - string or undefined
//
// rules:
// - return the string repeated the number of times as th second argument
// - if the second argument is not a positive number, return undefined
// - if the second argument is 0, return an empty string
// - you can only concatenate strings, but use no other string class method
//
// algorithm:
// - declare a variable for i
// - declare a variable for return string
// - create a guard clause to return undefined if second argument is not a
//   positive integer
// - create a for loop, while i is less than or equal to the second argument
//   - concatenate the input string onto the return string
// - return the return string


function repeat(string, times) {
  var i;
  var returnStr = '';

  if (times < 0 || typeof times !== 'number') {
    return undefined;
  }

  for (i = 1; i <= times; i += 1) {
    returnStr += string
  }

  return returnStr;
}

console.log(repeat('abc', 1));
console.log(repeat('abc', 2));
console.log(repeat('abc', -1));
console.log(repeat('abc', 0));
console.log(repeat('abc', 'a'));
console.log(repeat('abc', false));
console.log(repeat('abc', null));
console.log(repeat('abc', '   '));
