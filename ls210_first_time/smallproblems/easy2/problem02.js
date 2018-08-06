// input: string
// output: a box with the string inside

// rules: write the input string to the console inside of a box

// pseudo code:
// - create a series of console.log statements and interpolate the input string
//   into the correct area

function logInBox(str) {
  var dashes = '';
  var spaces = '';

  for (i = 0; i < str.length; i++) {
    dashes += '-';
    spaces += ' ';
  }

  console.log('+-' + `${dashes}` + '-+');
  console.log('| ' + `${spaces}` + ' |');
  console.log('| ' + `${str}` + ' |');
  console.log('| ' + `${spaces}` + ' |');
  console.log('+-' + `${dashes}` + '-+');
}

logInBox('To boldly go where no one has gone before.');
logInBox('');