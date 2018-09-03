// Write a Function named anagram that takes two arguments: a word and an array
// of words. Your function should return an array that contains all the words
// from the array argument that are anagrams of the word argument. For example,
// given the word "listen" and an array of candidate words like "enlist", "google",
// "inlets", and "banana", the program should return an array that contains
// "enlist" and "inlets".

// input - string, array of words
// output - array of words
//
// rules:
// - return an array of words containing words from the input array that are anagrams
//   of the input string
//
// algorithm:
// - sort the input string
// - iterate over the input array
//   - if the sorted array word equals the sorted input string, push to a new array
// - return new array

function anagram(word, list) {
  word = sortedLetters(word);

  return list.filter(function (testWord) {
    return word === sortedLetters(testWord);
  });
}

function sortedLetters(word) {
  return word.split('').sort().join('');
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
