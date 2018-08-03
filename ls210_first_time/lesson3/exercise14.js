function indexOf(firstString, secondString) {
  var secondLength = secondString.length;
  var index = 0;
  var secondIndex

  for (; index < firstString.length; index++) {
    if (firstString[index] === secondString[0]) {
      for (secondIndex = 0; secondIndex <= secondLength; secondIndex++) {
        if (firstString[index + secondIndex] !== secondString[secondIndex]) {
          break;
        } else if (secondIndex === secondLength - 1) {
          return index;
        }
      }
    }
  }
  return -1;
}


function lastIndexOf(firstString, secondString) {
  var secondLength = secondString.length;
  var index = 0;
  var secondIndex

  for (; index < firstString.length; index++) {
    if (firstString[index] === secondString[0]) {
      for (secondIndex = 0; secondIndex <= secondLength; secondIndex++) {
        if (firstString[index + secondIndex] !== secondString[secondIndex]) {
          break;
        } else if (secondIndex === secondLength) {
          return index;
        }
      }
    }
  }
  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1