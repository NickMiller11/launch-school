function greetings(arr, obj) {
  var name = arr.join(' ');
  var job = obj.title + ' ' + obj.occupation;

  console.log('Hello, ' + name + '! Nice to have a ' + job + ' around.');
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });