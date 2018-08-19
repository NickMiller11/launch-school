function wordCount(str) {
  var wordArray = str.split(' ');
  var counts = {};
  var i;
  var currentWord;

  for (i = 0; i < wordArray.length; i += 1) {
    currentWord = wordArray[i];
    if (counts[currentWord]) {
      counts[currentWord] += 1;
    } else {
      counts[currentWord] = 1;
    }
  }

  return counts;
}


console.log(wordCount('box car cat bag box'));