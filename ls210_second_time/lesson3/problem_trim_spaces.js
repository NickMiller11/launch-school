// input - string
// output - string
//
// rules:
// - return the input string with both beginning and ending spaces removed
// - do not alter the spaces between words
//
// algorithm:
// - count the number of spaces from index 0
// - if the count is more than 0
//   - move all the characters down one index that many times
// - count the number of spaces from str.length - 1
// - add the first and last count together
// - set the string length to match initial length minus both counts

// altering the above algorithm:
// declare a variable for return string, set to empty string
// iterate over initial string from index 0
// once we reach a non-space character, add all the remaining characters to
//  return string
// count spaces on end
// set return string length to input string length minus ending spaces

function trim(str) {
  var returnStr = '';
  var i;
  var j;
  var nonSpace = false;

  for (j = str.length - 1; j >= 0; j -= 1) {
    if (str[j] !== ' ') {
      break;
    }
  }

  for (i = 0; i <= j; i += 1) {
    if (str[i] !== ' ') {
      nonSpace = true;
    }

    if (nonSpace) {
      returnStr += str[i]
    }
  }
  
  return returnStr;
}


console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""
