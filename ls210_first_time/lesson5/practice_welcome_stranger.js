function greetings(name, status) {
  var nameGreet = 'Hello, ' + name.join(' ') + '!';
  var statusGreet = 'Nice to have a ' + status.title + ' ' + status.occupation + ' around.'

  console.log(nameGreet + ' ' + statusGreet);

}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// function greetings() {
//   var name = '';
//   var i;

//   for (i = 0; i < arguments[0].length; i++) {
//     name += arguments[0][i];
//     if (i === arguments[0].length - 1) {
//       break;
//     }

//     name += ' ';
//   }

//   console.log('Hello, ' + name + '! Nice to have a '
//                         + arguments[1]['title'] + ' '
//                         + arguments[1]['occupation'] + ' around.' );

//   console.log(arguments[0]);
//   console.log(arguments[1]);
// }