// input: two strings
// output: log one or more strings
//
// rules:
// - log substrings of the first input string
// - each substring should be deliniated by the second string
// - log "ERROR: No delimiter" if a second string is not provided
//
// algorithm:
// - declare a variable for index
// - declare a variable for substring
// - create a for loop (while str[i] does not equal the delimiter)
//   - concatenate the character to the substring
//   - if delimiter
//     - log the substring
//     - add 1 to i
//     - reset substring


function splitString(string, delimiter) {
  var i;
  var substr = '';

  if (arguments.length !== 2) {
    console.log('ERROR: No delimiter');
    return;
  }

  if (delimiter === '') {
    for (i = 0; i < string.length; i += 1) {
      console.log(string[i]);
    }
    return;
  }

  for (i = 0; i < string.length; i += 1) {
    if (string[i] !== delimiter) {
      substr += string[i];
    } else {
      console.log(substr);
      substr = '';
    }
  }

  console.log(substr);
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// // logs:
// // ERROR: No delimiter
//
splitString('hello', '');
// // logs:
// // h
// // e
// // l
// // l
// // o
//
splitString('hello', ';');
// // logs:
// // hello
//
splitString(';hello;', ';');
// // logs:
// //  (this is a blank line)
// // hello
