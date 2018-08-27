function substringsAtStart(str) {
  return str.split('').map(growSubstring);
}

function growSubstring(char, idx, arr) {
  return arr.slice(0, idx + 1).join('');
}

console.log(substringsAtStart('abc'));      // ["a", "ab", "abc"]
console.log(substringsAtStart('a'));        // ["a"]
console.log(substringsAtStart('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]