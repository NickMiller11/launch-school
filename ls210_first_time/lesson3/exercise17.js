function repeat(string, times) {
  var originalString = string;

  if (typeof times !== "number") {
    return undefined;
  } else if (times < 0) {
    return undefined;
  } else if (times === 0) {
    return "";
  } else {
    while (times > 1) {
      originalString += string;
      times -= 1;
    }
  }

  return originalString;
}

console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined