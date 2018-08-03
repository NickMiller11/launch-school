function splitString(string, delimiter) {
  var str_length = string.length;
  var i
  var substring = '';



  for (i = 0; i < str_length; i++) {
    if (string[i] === delimiter) {
      console.log(substring);
      substring = '';
    } else if (delimiter === '') {
      console.log(string[i]);
    } else if (delimiter === undefined) {
      return console.log('ERROR: No delimiter');
    } else {
      substring += string[i];
    }
  }

  console.log(substring);
}

// splitString('abc,123,hello world', ',');
// // logs:
// // abc
// // 123
// // hello world

// splitString('hello');
// logs:
// ERROR: No delimiter

// splitString('hello', '');
// // logs:
// // h
// // e
// // l
// // l
// // o

// splitString('hello', ';');
// // logs:
// // hello

// splitString(';hello;', ';');
// // logs:
// //  (this is a blank line)
// // hello