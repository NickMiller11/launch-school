// input - 3 strings from user
// output - log string to screen

// rules -
// - if user guesses password, display logged in message
// - if user doesn't guess correct password, keep prompting
// - display access denied message to user if password guessed wrong 3 times

// algorith -
// - declare a variable and assign it to a string to be used as password
// - declare a variable to count guesses
// - create a for loop - while guess counter is less than 3
//   - prompt user for password
//   - compare entered password to password var
//   - return logged in message if it equals
// - return access denied message

function password() {
  var password = 'hirakegoma';
  var guesses;

  for (guesses = 1; guesses <= 3; guesses += 1) {
    var userPassword;
    userPassword = prompt('What is the password:');
    if (password === userPassword) {
      alert('You have successfully logged in.');
      return;
    }
  }

  alert('You have been denied access.');
}

password();