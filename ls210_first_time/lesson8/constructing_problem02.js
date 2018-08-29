// input - string
// output - string

// rules:
// - return an acronym that contains the first letter of each word of the input string

// acronym:
// - split the string into an array
// - use #map method to return the first letter of each word

function acronym(string) {
  return string.split(/[\s-]/g).map(function (word) {
    return word[0].toUpperCase();
  }).join('');
}

console.log(acronym('Portable Network Graphics'));                  // "PNG"
console.log(acronym('First In, First Out'));                        // "FIFO"
console.log(acronym('PHP: HyperText Preprocessor'));                // "PHP"
console.log(acronym('Complementary metal-oxide semiconductor'));    // "CMOS"
console.log(acronym('Hyper-text Markup Language'));                 // "HTML"