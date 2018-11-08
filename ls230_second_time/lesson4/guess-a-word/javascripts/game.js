var $letters = $('#spaces');
var $guesses = $('#guesses');
var $apples = $('#apples');
var $message = $('#message');
var $replay = $('#replay');

var randomWord = function() {
  var words = ['apple', 'banana', 'orange','pear'];

  return function() {
    var idx = Math.floor(Math.random() * words.length);
    var word = words[idx];
    words.splice(idx, 1);
    return word;
  };
}();

function Game() {
  this.incorrect = 0;
  this.lettersGuessed = [];
  this.correctSpaces = 0;
  this.word = randomWord();
  if(!this.word) {
    this.displayMessage("Sorry, I've run out of words!")
    this.toggleReplayLink(false);
    return this;
  }
  this.word = this.word.split('');
  this.init();
}

Game.prototype = {
  guesses: 6,
  createBlanks: function() {
    var spaces = (new Array(this.word.length + 1)).join('<span></span>');

    $letters.find('span').remove();
    $letters.append(spaces);
    this.$spaces = $('#spaces span');
  },
  fillBlanksFor: function(letter) {
    var self = this;

    self.word.forEach(function (l, i) {
      if (letter === l) {
        self.$spaces.eq(i).text(letter);
        self.correctSpaces += 1;

      }
    });
  },
  processGuess: function(e) {
    var letter = String.fromCharCode(e.which);

    if (notALetter(e.which)) { return; }
    if (this.duplicateGuess(letter)) { return; }

    if ($.inArray(letter, this.word) !== -1) {
      this.fillBlanksFor(letter);
      this.renderGuess(letter);
      if (this.correctSpaces === this.$spaces.length) {
        this.win();
      }
    } else {
      this.renderIncorrectGuess(letter);
    }
    if (this.incorrect === this.guesses) {
      this.lose();
    }
  },

  win: function() {
    this.unbind();
    this.toggleReplayLink(true);
    this.displayMessage('You win!');
    this.setGameStatus('win');
  },

  lose: function() {
    this.unbind();
    this.toggleReplayLink(true);
    this.displayMessage("Sorry! You're out of guesses.")
    this.setGameStatus('lose');
  },

  duplicateGuess: function(letter) {
    var duplicate = this.lettersGuessed.indexOf(letter) !== -1;

    if (!duplicate) { this.lettersGuessed.push(letter); }

    return duplicate;
  },

  renderIncorrectGuess: function(letter) {
    this.incorrect += 1;
    this.renderGuess(letter);
    this.setClass();
  },

  setClass: function() {
    $apples.removeClass().addClass('guess_' + this.incorrect);
  },

  renderGuess: function(letter) {
    $('<span />', {
      text: letter,
    }).appendTo($guesses);
  },

  emptyGuesses: function() {
    $guesses.find('span').remove();
  },

  displayMessage: function(text) {
    $message.text(text);
  },

  toggleReplayLink: function(which) {
    $replay.toggle(which);
  },

  unbind: function() {
    $(document).off('.game');
  },

  bind: function() {
    $(document).on('keypress.game', this.processGuess.bind(this));
  },

  setGameStatus: function(status) {
    $(document.body).removeClass();
    if (status) {
      $(document.body).addClass(status);
    }
  },

  init: function() {
    this.bind();
    this.setClass();
    this.toggleReplayLink(false);
    this.emptyGuesses();
    this.createBlanks();
    this.setGameStatus();
    this.displayMessage('');
  },
}

function notALetter(code) {
  var aCode = 97;
  var zCode = 122;

  return code < aCode || code > zCode;
}

$replay.on('click', function(e) {
  e.preventDefault();
  new Game();
});

new Game();

// $(function() {
//   $(document).keypress(function(e) {
//     var key = String.fromCharCode(e.which);
//
//   });
// });
