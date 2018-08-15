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






// function indexOf(firstString, secondString) {
//   var i;
//   var firstIndex = -1;
//   var holdIndex;
//   var buildString = '';
//
//   for (i = 0; i < firstString.length; i += 1) {
//     var currentLetter = firstString[i];
//
//     if (currentLetter === secondString[0]) {
//       holdIndex = i;
//
//       while (i - holdIndex < secondString.length) {
//         buildString += firstString[i];
//         i += 1;
//       }
//
//       if (buildString === secondString) {
//         firstIndex = holdIndex;
//         break;
//       }
//     }
//   }
//
//   return firstIndex;
// }

// I'm not a big fan of my solution, relatively messy

// function lastIndexOf(firstString, secondString) {
//   var i;
//   var firstIndex = -1;
//   var holdIndex;
//   var buildString = '';
//
//   for (i = firstString.length - 1; i >= 0; i -= 1) {
//     var currentLetter = firstString[i];
//
//     if (currentLetter === secondString[secondString.length - 1]) {
//       holdIndex = i;
//
//       while (holdIndex - i < secondString.length) {
//         buildString += firstString[i];
//         i -= 1;
//       }
//
//       if (buildString.split('').reverse().join('') === secondString) {
//         firstIndex = (holdIndex + 1) - secondString.length;
//         break;
//       }
//     }
//   }
//
//   return firstIndex;
// }

// function lastIndexOf(firstString, secondString) {
//   var limit = firstString.length - secondString.length;
//   var matchcount;
//   var i;
//   var j;
//
//   for (i = limit; i >= 0; i -= 1) {
//     matchcount = 0;
//
//     for (j = 0; j < secondString.length; j += 1) {
//       if (firstString[i + j] === secondString[j]) {
//         matchcount += 1;
//       } else {
//         break;
//       }
//     }
//
//     if (matchcount === secondString.length) {
//       return i;
//     }
//   }
//
//   return -1;
// }

// console.log(indexOf('Some strings', 's'));                      // 5
// console.log(indexOf('Blue Whale', 'Whale'));                    // 5
// console.log(indexOf('Blue Whale', 'Blute'));                    // -1
// console.log(indexOf('Blue Whale', 'leB'));                      // -1
//
// console.log(lastIndexOf('Some strings', 's'));                  // 11
// console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
// console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));

// ----- second try - practicing to get better --------

// input - two strings
// output - integer
//
// rules:
// - return the index where the first instance of the secondString appears
//   in the firstString
// - if the secondString does not appear in the first string, return -1
//
// algorithm:
// - iterate through the first string, comparing the current char with the
//   char at index 0 of the second string
// - if the characters match
//   - iterate a counter
// - if the characters do not match
//   - reset counter
// - break if counter equals lenght of secondString
// - return i minus counter

function indexOf(firstString, secondString) {
  var i;
  var j;
  var counter;
  var limit = firstString.length - secondString.length;

  for (i = 0; i <= limit; i += 1) {
    counter = 0;

    for (j = 0; j < secondString.length; j += 1)
      if (firstString[i + j] === secondString[j]) {
        counter += 1;
      } else {
        break;
      }

    if (counter === secondString.length) {
      return i;
    }
  }

  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

// console.log(lastIndexOf('Some strings', 's'));                  // 11
// console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
// console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));
