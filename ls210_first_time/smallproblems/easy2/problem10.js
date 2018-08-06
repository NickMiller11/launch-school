// input: integer
// output: string

// rules:
// - return the century number and suffix based on the year
// - a century is between the year that ends in 01 until 00

// pseudo code:
// - divide the year by 100 and add 1 to get the century
// - check the last two digits to confirm the century
// - turn the number into a string and add a suffix based on number rules


function century(year) {
  var cent = Math.floor(year / 100)
  var centuryString

  if (year % 100 !== 1) {
    cent += 1;
  }

  centuryString = cent.toString();

  return centuryString + centurySuffix(cent);
}

function centurySuffix(centuryNumber) {
  var lastDigit

  if (catchWithTh(centuryNumber % 100)) {
    return 'th';
  }

  lastDigit = centuryNumber % 10;
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

function catchWithTh(lastTwo) {
  return lastTwo === 11 || lastTwo === 12 || lastTwo === 13;
}

console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"