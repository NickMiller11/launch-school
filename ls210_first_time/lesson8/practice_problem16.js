var name = prompt("What is your name?");

if (name.endsWith('!')) {
  var response = 'hello ' + name.slice(0, -1) + '. why are we screaming?'
  console.log(response.toUpperCase());
} else {
  console.log('Hello ' + name);
}