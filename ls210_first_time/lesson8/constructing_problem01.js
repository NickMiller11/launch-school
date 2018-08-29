// input - string
// output - string

// rules:
// - return a newstring that is the original string with letters in reversed order

// function reverse(string) {
//   return string.split(' ').map(function (word) {
//     return reverseWord(word);
//   }).reverse().join(' ');
// }

// function reverseWord(word) {
//   return word.split('').reverse().join('');
// }

function reverse(string) {
  return string.split('').reverse().join('')
}

console.log(reverse('hello'));                  // returns "olleh"
console.log(reverse('The quick brown fox'));    // returns "xof nworb kciuq ehT"