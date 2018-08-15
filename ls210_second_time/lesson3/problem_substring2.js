// input - string, optional arguments
// output - string
//
// rules:
// - return the substring from the start index (inclusive) to the end index
//   (not inclusive)
// - if the value of start is greater than end, swap the two values
// - if start is equal to end, return an empty string
// - if end is omitted, the end variable inside the function is undefined.
//   Return the substring from start until the end of the string
// - if either start or end is less than 0 or NaN, treat it as 0
// - if either start or end is greater than the length of the string, set it as
//   equal to the length of the string
//
// algorithm:
// - declare a variable for index
// - declare a variable for return string
// - create a for loop (while index is less than end)
//   - concatenate char at string[index] to return string
// - return return string

function substring(string, start, end) {
  var i;
  var returnStr = '';

  if (end === undefined) {
    end = string.length;
  }

  if (start > end) {
    var temp = start;
    start = end;
    end = temp;
  }

  if (start < 0 || isNaN(start)) {
    start = 0;
  }

  if (end < 0 || isNaN(end)) {
    end = 0;
  }

  if (start > string.length) {
    start = string.length;
  }

  if (end > string.length) {
    end = string.length;
  }

  for (i = start; i < end; i += 1) {
    returnStr += string[i];
  }

  return returnStr;
}

var string = 'hello world';

console.log(substring(string, 2, 4));
console.log(substring(string, 4, 2));
console.log(substring(string, 0, -1));
console.log(substring(string, 2));
console.log(substring(string, 'a'));
console.log(substring(string, 8, 20));
