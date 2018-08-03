function substring(string, start, end) {
  var finalString = '';
  var i
  var temp

  if (start > end) {
    temp = start;
    start = end;
    end = temp;
  }

  if (end === undefined) {
    end = string.length;
  } else if (end < 0 || isNaN(start)) {
    end = 0;
  } else if (end > string.length) {
    end = string.length;
  }

  if (start < 0 || isNaN(start) ) {
    start = 0;
  } else if (start > string.length) {
    start = string.length;
  }


  for (i = start; i < end && i >= 0; i++) {
    char = string[i];
    finalString += char;
  }

  return finalString;
}

var string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"