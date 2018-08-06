// input: string
// output: string

// rules: return a string with all consecutive duplicate characters removed

// pseudo code:
// - create a var for final string
// - create a var for index
// - while the index is less than the string length
//   - if the current letter is the same as the one behind it, skip
//   - else, add to the final string


function crunch(str) {
  var finalString = '';
  var i

  for (i = 0; i < str.length; i++) {
    if (i === 0) {
      finalString += str[i];
    } else if (str[i] === str[i-1] ) {
      continue;
    } else {
      finalString += str[i];
    }
  }

  return finalString;
}


console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""