// input - string, array of strings
// output - array of strings

// rules:
// - return an array containing words from the input array that are anagrams
//   of the input string

// algorithm:
// - use filter to compare a sorted input string against a sorted string from the
//   array

function anagram(word, list) {
  return list.filter(function (candidate) {
    return areAnagrams(candidate, word);
  });
}

function areAnagrams(source, target) {
  var sourceLetters = source.split('');
  var targetLetters = target.split('');

  return compareArrays(sourceLetters, targetLetters);
}

function compareArrays(array1, array2) {
  return array1.sort().join('') === array2.sort().join('');
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]

