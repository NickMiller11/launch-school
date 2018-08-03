function substr(string, start, length) {
  var finalString = '';
  var char

  if (start < 0) {
    start += string.length;
  }

  for (i = 0; i < length && i + start < string.length; i++) {
    char = string[start + i];
    finalString += char;
  }

  return finalString;
}

var string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""