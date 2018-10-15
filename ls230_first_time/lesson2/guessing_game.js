document.addEventListener('DOMContentLoaded', function() {
  var answer = Math.floor(Math.random() * 100) + 1;
  var input = document.querySelector('#guess');
  var form = document.querySelector('form');
  var link = document.querySelector('a');

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    var guess = parseInt(input.value, 10);
    var message;

    if (guess === answer) {
      message = 'You guessed it!';
    } else if (guess > answer) {
      message = 'My number is lower than ' + String(guess);
    } else {
      message = 'My number is higher than ' + String(guess);
    }

    var paragraph = document.querySelector('p');
    paragraph.textContent = message;

  });

  link.addEventListener('click', function(event) {
    answer = Math.floor(Math.random() * 100) + 1;
    paragraph.textContent = 'Please guess a number from 1 to 100';
  });

});
