// input - two numbers
// output - 1, -1, or 0
//
// rules:
// - if input1 is greater than input 2, return 1
// - if input1 is less than input 2, return -1
// - if input1 is equal to input 2, return 0
// - if either input number contains characters other than digits and '.', return
//   null
//
// algorithm:
// remove the dots to get whole numbers
// - change the number into a string, split by dots to get an array
// - join the numbers again, parseInt back into a number
// - multiply both numbers by 10 to the length of the longest string minus 1
// compare the whole numbers using an if conditional

// Explaining version comparing:
// A version number is always the left-most number. The number to the right is a fraction
// of the version number, and the number to the right of that one is a fraction of
// the fraction.  Therefore, the number in the left-most spot always determines, which
// version is higher. If the leftmost number is the same when comparing two different
// version numbers, the second leftmost numbers should be compared.

function compareVersions(version1, version2) {
  var version1 = formatAsNumber(version1);
  var version2 = formatAsNumber(version2);

  if (checkForInvalidChars(version1) || checkForInvalidChars(version2)) {
    return null;
  }

  var lengthDifference = Math.abs(version1.toString().length - version2.toString().length);

  if (version1.toString().length > version2.toString().length) {
    version2 *= Math.pow(10, lengthDifference);
  } else if (version1.toString().length < version2.toString().length) {
    version1 *= Math.pow(10, lengthDifference);
  }

  if (version1 > version2) {
    return 1;
  } else if (version1 < version2) {
    return -1;
  } else if (version1 === version2) {
    return 0;
  }
}

function formatAsNumber(version) {
  return parseInt(version.split('.').join(''), 10);
}

function checkForInvalidChars(version) {
  var regex = /[^\d\.]/
  return regex.test(version);
}

console.log(compareVersions("3.0.0", "4.2.3.0"));
console.log(compareVersions("1", "1.0"));
console.log(compareVersions("1.0", "1.2"));
console.log(compareVersions("3.2.3", "3.2.3"));
console.log(compareVersions("3.2.3", "3.2.0"));
console.log(compareVersions("sam123", "1"));
console.log(compareVersions("4.0.0", "burger"));
