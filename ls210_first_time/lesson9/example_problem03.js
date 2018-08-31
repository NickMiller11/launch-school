/*
input - string
output - array of numbers

rules:
- return an array of numbers that represent all numbers in the input
  string
- ranges in the input string should be expanded out to display each number
  in the range
- the numbers in the input string are in numerical order from smallest to largest
- if the next number in the string has fewer digits than the previous one,
  add the same largest place digit or same + 1 to make the next number larger
  than the previous
- ranges can be designated by '-', ':', '..'

algorithm:
- add each number from the input string into the array, making sure to convert
  from 'short-hand' and ranges

- create a new array that will be returned
- convert input string into array
  - convert each shorthand number into actual number
  - convert each range into a full range of numbers
- add each number to the return array
*/

function convertShorthandNumbers(numberString) {

}

console.log(convertShorthandNumbers("1,3,7,2,4,1")); // [1, 3, 7, 12, 14, 21]
console.log(convertShorthandNumbers("1-3, 1-2")); // [1, 2, 3, 11, 12]
console.log(convertShorthandNumbers("1:5:2")); // [1, 2, 3, 4, 5, 6, ... 12]
console.log(convertShorthandNumbers("104-2")); // [104, 105, ... 112]
console.log(convertShorthandNumbers("545, 64:11")); // [545, 564, 565, .. 611]
