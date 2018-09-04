// Implement a function that takes a string as an argument and returns a
// new string that contains the original string in reverse.

// input - string
// output - string
//
// rules:
// - return the reverse of the input string
//
// algorithm:
// - call #reverse on the input string

function reverse(string) {
  return string.split('').reverse().join('');
}

console.log(reverse('hello'));                  // returns "olleh"
console.log(reverse('The quick brown fox'));    // returns "xof nworb kciuq ehT"
