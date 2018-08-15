// input - two strings
// output - boolean
//
// rules:
// - return true if the first string starts with the second string
// - return false otherwise
// - return false if the second string is longer than the first string
// - return true if the second string is empty
//
// algorithm:
// - declare a variable for index
// - create a for loop (while index is less than or equal to secondString.length)
//   - if string one char does not equal string two char, return false
// - return true

function startsWith(string, searchString) {
  var i;

  for (i = 0; i < searchString.length; i += 1) {
    if (string[i] !== searchString[i]) {
      return false
    }
  }

  return true;
}

var str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We'));
console.log(startsWith(str, 'We put'));
console.log(startsWith(str, ''));
console.log(startsWith(str, 'put'));

var longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString));
