// Write a function that generates and returns an acronym from a string of words.
// For example, the function should return "PNG" for the string "Portable Network
// Graphics". Count compound words (words connected with a dash) as separate words.

// input - string
// output - string

// rules:
// - return a string that contains the uppercased first letter of each word from
//   the input string
// - words separated by dashes are considered separate words

// algorithm:
// - replace dashes with spaces
// - split word by spaces
// - add uppercased first letter to new string
// - return new string

function acronym(string) {
  return string.replace(/-/g, ' ').split(' ').map(function (word) {
    return word[0].toUpperCase();
  }).join('');
}

console.log(acronym('Portable Network Graphics'));                  // "PNG"
console.log(acronym('First In, First Out'));                        // "FIFO"
console.log(acronym('PHP: HyperText Preprocessor'));                // "PHP"
console.log(acronym('Complementary metal-oxide semiconductor'));    // "CMOS"
console.log(acronym('Hyper-text Markup Language'));                 // "HTML"
