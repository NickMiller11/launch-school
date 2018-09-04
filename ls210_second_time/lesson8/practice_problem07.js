// Re-implement the sentiment analysis with regex-based positive and negative word lists.
// The use of regex to process text-based data is extremely powerful. In the previous
// practice problem, we did not count words that were just different forms of the words
// in the positive and negative word lists. For instance, we didn't count "scorns" since
// it isn't an exact match for "scorn".

// We could add the variations of each word; for example: fortune --> fortunes, respect -->
// respected, oppress --> oppressed, or death --> deaths. This works, but we can use regex
// to make the relationship between variants more evident:

var textExcerpt = 'To be or not to be-that is the question:\n' +
  'Whether \'tis nobler in the mind to suffer\n' +
  'The slings and arrows of outrageous fortune,\n' +
  'Or to take arms against a sea of troubles,\n' +
  'And, by opposing, end them. To die, to sleep-\n' +
  'No more-and by a sleep to say we end\n' +
  'The heartache and the thousand natural shocks\n' +
  'That flesh is heir to-\'tis a consummation\n' +
  'Devoutly to be wished. To die, to sleep-\n' +
  'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
  'For in that sleep of death what dreams may come,\n' +
  'When we have shuffled off this mortal coil,\n' +
  'Must give us pause. There\'s the respect\n' +
  'That makes calamity of so long life.\n' +
  'For who would bear the whips and scorns of time,\n' +
  'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
  'The pangs of despised love, the law’s delay, [F: disprized]\n' +
  'The insolence of office, and the spurns\n' +
  'That patient merit of the unworthy takes,\n' +
  'When he himself might his quietus make\n' +
  'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
  'To grunt and sweat under a weary life,\n' +
  'But that the dread of something after death,\n' +
  'The undiscovered country from whose bourn\n' +
  'No traveler returns, puzzles the will\n' +
  'And makes us rather bear those ills we have\n' +
  'Than fly to others that we know not of?\n' +
  'Thus conscience does make cowards of us all,\n' +
  'And thus the native hue of resolution\n' +
  'Is sicklied o\'er with the pale cast of thought,\n' +
  'And enterprises of great pitch and moment, [F: pith]\n' +
  'With this regard their currents turn awry, [F: away]\n' +
  'And lose the name of action.-Soft you now,\n' +
  'The fair Ophelia.-Nymph, in thy orisons\n' +
  'Be all my sins remembered';

var positiveRegex = /(fortunes?)|(dream(s|t|ed)?)|(love(s|d)?)|(respect(s|ed)?)|(patien(ce|t)?)|(devout(ly)?)|(nobler?)|(resolut(e|ion)?)/gi;
var negativeRegex = /(die(s|d)?)|(heartached?)|(death)|(despise(s|d)?)|(scorn(s|ed)?)|(weary)|(troubles?)|(oppress(es|ed|or('s)?)?)/gi;


function sentiment(text) {
  var wordsArray = text.replace(/[,.;:\-?!]/g, '').split(/\s/);
  var positiveWordCount;
  var negativeWordCount;
  var overallSentiment;

  positiveWordCount = wordsArray.filter(function (word) {
    if (positiveRegex.test(word)) {
      return word;
    }
  });

  negativeWordCount = wordsArray.filter(function (word) {
    if (negativeRegex.test(word)) {
      return word;
    }
  });

  if (positiveWordCount > negativeWordCount) {
    overallSentiment = 'Positive';
  } else if (positiveWordCount < negativeWordCount) {
    overallSentiment = 'Negative';
  } else if (positiveWordCount === negativeWordCount) {
    overallSentiment = 'Neutral';
  }

  overallSentiment = positiveWordCount.length > negativeWordCount.length ? 'Positive' : 'Negative';

  console.log('There are ' + positiveWordCount.length + ' positive words in the text.')
  console.log('Positive sentiments: ' + positiveWordCount.join(', '));
  console.log('');
  console.log('There are ' + negativeWordCount.length + ' negative words in the text.');
  console.log('Negative sentiments: ' + negativeWordCount.join(', '));
  console.log('');
  console.log('The sentiment of the text is ' + overallSentiment + '.');
}

sentiment(textExcerpt);

// console output

// There are 9 positive type words in the text.
// Positive sentiments: nobler, fortune, devoutly, dream, dreams, respect, love, patient, resolution

// There are 10 negative type words in the text.
// Negative sentiments: troubles, die, heartache, die, death, scorns, oppressor's, despised, weary, death

// The sentiment of the text is Negative.