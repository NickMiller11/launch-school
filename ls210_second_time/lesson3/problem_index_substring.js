// // indexOf

// input - two strings
// output - integer

// rules:
// - return the index where the first instance of the second string
//   begins in the first string
// - return -1 if the first string does not contain the second string

// algorithm:
// - use two nested loops
// - declare a variable for index of first string
// - declare a variable for index of second string
// - iterate over first string until a character matches the first character in the second string
//   - declare a variable for that first index
//   - iterate over the second string checking each character against the next one
//     in the first string
//   - return first index variable if it's a match
//   - break if it's not a match
// - return -1 if nothing is a match


// // lastIndexOf

// input - two strings
// output - integer

// rules:
// - return the index where the last instance of the second string
//   begins in the first string

// algorithm:






function indexOf(firstString, secondString) {
  var i;
  var firstIndex = -1;
  var holdIndex;
  var buildString = '';

  for (i = 0; i < firstString.length; i += 1) {
    var currentLetter = firstString[i];

    if (currentLetter === secondString[0]) {
      holdIndex = i;

      while (i - holdIndex < secondString.length) {
        buildString += firstString[i];
        i += 1;
      }

      if (buildString === secondString) {
        firstIndex = holdIndex;
        break;
      }
    }
  }

  return firstIndex;
}

// Having some trouble on lastIndexOf, it's not just a straight "go reverse" job

function lastIndexOf(firstString, secondString) {
  var i;
  var firstIndex = -1;
  var holdIndex;
  var buildString = '';

  for (i = firstString.length - 1; i >= 0; i -= 1) {
    var currentLetter = firstString[i];

    if (currentLetter === secondString[secondString.length - 1]) {
      holdIndex = i;

      while (holdIndex - i < secondString.length) {
        buildString += firstString[i];
        i -= 1;
      }

      if (buildString.reverse === secondString) {
        firstIndex = holdIndex;
        break;
      }
    }
  }

  return firstIndex;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1