// input - string
// output - object

// rules:
// - count the frequency of each character
// - add the character/frequency property to the return object if the frequency
//   is 2 or more
// - ignore case

// algorithm:
// - declare an index variable
// - declare a variable for the return object
// - split the string into an array
// - iterate through the array, checking each downcased character
//   - if the character is already included in the return object, add 1 to the frequency
//   - else, add the character with a frequncy of 1
// - delete any property with value of 1
// - return object

function deleteSingles(repeatedObj) {
  var keyArray = Object.keys(repeatedObj);
  var j;
  var currentChar;

  for (j = 0; j < keyArray.length; j += 1) {
    currentChar = keyArray[j].toLowerCase();

    if (repeatedObj[currentChar] === 1) {
      delete repeatedObj[currentChar];
    }
  }

  return repeatedObj;
}

function repeatedCharacters(word) {
  var i;
  var repeatedObj = {};
  var arr = word.split('');
  var currentChar;
  var keyArray;

  for (i = 0; i < arr.length; i += 1) {
    currentChar = arr[i].toLowerCase();
    keyArray = Object.keys(repeatedObj);

    if (keyArray.indexOf(currentChar) !== -1) {
      repeatedObj[currentChar] += 1;
    } else {
      repeatedObj[currentChar] = 1;
    }
  }

  repeatedObj = deleteSingles(repeatedObj);
  return repeatedObj;
}

console.log(repeatedCharacters('Programming'));
console.log(repeatedCharacters('Combination'));
console.log(repeatedCharacters('Pet'));
console.log(repeatedCharacters('Paper'));
console.log(repeatedCharacters('Baseless'));
