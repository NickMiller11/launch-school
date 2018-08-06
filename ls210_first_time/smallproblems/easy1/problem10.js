function asciiValue(str) {
  var i
  var sum = 0;
  var asciiCode

  for (i = 0; i < str.length; i++) {
    asciiCode = str.charCodeAt(i);
    sum += asciiCode;
  }
  return sum;
}


console.log(asciiValue('Four score'));         // 984
console.log(asciiValue('Launch School'));      // 1251
console.log(asciiValue('a'));                  // 97
console.log(asciiValue(''));                   // 0