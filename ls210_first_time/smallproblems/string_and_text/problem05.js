function swapcase(string) {
  return string.split('').map(function (char) {
    if (/[a-z]/.test(char)) {
      return char.toUpperCase();
    } else if (/[A-Z]/.test(char)) {
      return char.toLowerCase();
    } else {
      return char
    }
  }).join('');
}

console.log(swapcase('CamelCase'));              // "cAMELcASE"
console.log(swapcase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"