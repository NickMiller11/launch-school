// input - string, two integers
// output - string
//
// rules:
// - return a substring of the string based on the two integers
// - the first integer is the start index
// - if the first integer is negative, treat it as string.length - integer
// - the second integer is the length of the return substring
// - if the length of the return substring exceeds the number of available
//   characters, just use the available characters
// - you cannot use any string class methods other than length and brackets
//
// algorithm:
// - declare a variable for index
// - declare a variable for return string
// - check to see if start index is negative
//   - if so, convert it
// - check to see if length is more than available characters
//   - if so, convert it
// - create a for loop (while index is less than length input)
//   - add current index char to return string
// - return return string

function substr(string, start, length) {
  var i;
  var returnStr = '';

  if (start < 0) {
    start = string.length + start;
  }

  if (start + length > string.length) {
    length = string.length - start;
  }

  for (i = 0; i < length; i += 1) {
    returnStr += string[start + i];
  }

  return returnStr;
}

var string = 'hello world';

console.log(substr(string, 2, 4));
console.log(substr(string, -3, 2));
console.log(substr(string, 8, 20));
console.log(substr(string, 0, -20));
console.log(substr(string, 0, 0));
