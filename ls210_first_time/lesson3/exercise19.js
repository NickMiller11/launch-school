function toLowerCase(string) {
  var finalString = '';
  var asciiNumeric
  var convertedChar

  for (i = 0; i < string.length; i++) {
    asciiNumeric = string.charCodeAt(i);
    if ( asciiNumeric >= 65 && asciiNumeric <= 90) {
      convertedChar = String.fromCharCode(asciiNumeric + 32);
      finalString += convertedChar;
    } else {
      finalString += string[i];
    }
  }

  return finalString;
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"