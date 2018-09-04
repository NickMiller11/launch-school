// Write a program that determines the sentence with the most words in some text.
// Sentences may end with periods (.), exclamation points (!), or question marks (?).
// You should treat any sequence of characters that are not spaces or sentence-ending
// characters, as a word. Log the longest sentence and its word count to the console.
// Pay attention to the expected output. Note that this problem is about manipulating
// and processing strings. As such, every detail about the string matters
// (e.g., case, punctuation, tabs, spaces, etc.).

// Post your solution as a Code Review in this lesson's forum.

var longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';

// input - multi-line string
// output - side effect: logging to console.
//
// rules:
// - log the longest sentence to the console
// - log the number of words in the sentence
// - words are any sequence of characters that are not spaces or sentence-ending
//   characters
// - sentences end in either periods, exclamation points, or question marks.
//
// algorithm:
// - split the text into an array by sentence-ending characters
// - sort the array by length of string
// - pull the string using regex by the string from the array (doesn't have sentence-
//   ending char)
// - log the number of words and sentence itself

function longestSentence(text) {
  var sortedTextArray;
  var sentenceArray;
  var sentence;

  sortedTextArray = longText.match(/([a-z][^\.?!]+\s)+([a-z]+[\.!?])/gi).sort(function (a, b) {
    return b.length - a.length;
  });

  sentenceArray = sortedTextArray[0].split(' ').filter(function (word) {
    return word.length > 0;
  });

  sentence = sentenceArray.join(' ');

  console.log(sentence);
  console.log('');
  console.log('The longest sentence has ' + String(sentenceArray.length) + ' words.');
}

longestSentence(longText);

// console output
// It is rather for us to be here dedicated to the great task remaining before us --
// that from these honored dead we take increased devotion to that cause for
// which they gave the last full measure of devotion -- that we here highly resolve
// that these dead shall not have died in vain -- that this nation, under God,
// shall have a new birth of freedom -- and that government of the people,
// by the people, for the people, shall not perish from the earth.

// The longest sentence has 86 words.


// Assuming the last sentence is removed:

// longestSentence(longText);

// console output
// Four score and seven years ago our fathers brought forth on this continent a
// new nation, conceived in liberty, and dedicated to the proposition that all
// men are created equal.

// The longest sentence has 30 words.
