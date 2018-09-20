/*

Write a function named greet that takes two arguments and logs a greeting:

> greet('howdy', 'Joe');
Howdy, Joe!
> greet('good morning', 'Sue');
Good morning, Sue!

*/

function greet(greeting, name) {
  capitalized = greeting[0].toUpperCase() + greeting.slice(1);
  console.log(capitalized + ', ' + name + '!');
}

greet('howdy', 'Joe');
greet('good morning', 'Sue');

/*
Use the partial function shown above and your solution to problem 1 to
create sayHello and sayHi functions that work like this:

> sayHello('Brandon');
Hello, Brandon!
> sayHi('Sarah');
Hi, Sarah!

*/

function customGreeting(greet, greeting) {
  return function(name) {
    return greet(greeting, name);
  };
}

var sayHello = customGreeting(greet, 'hello');
sayHello('Brandon');

var sayHi = customGreeting(greet, 'hi');
sayHi('Sarah');