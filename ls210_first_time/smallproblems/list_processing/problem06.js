// input - string
// output - array

// rules:
// - return an array that lists all possible substrings of the input string

algorithm:

function substrings(str) {
  var newArray = [];
  str.split('').forEach(function (char, idx, arr) {
    newArray.push(substringsAtStart(arr.slice(idx).join('')));
  });

  return newArray;
}

function substringsAtStart(str) {
  return str.split('').map(growSubstring);
}

function growSubstring(char, idx, arr) {
  return arr.slice(0, idx + 1).join('');
}

console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]