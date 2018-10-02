// function greet(greeting, name) {
//   greeting = greeting[0].toUpperCase() + greeting.slice(1);
//   console.log(greeting + ', ' + name + '!');
// }
//
// // greet('howdy', 'Joe');
// // greet('good morning', 'Sue');
//
// function partial(primary, arg1) {
//   return function(arg2) {
//     return primary(arg1, arg2);
//   }
// }
//
// var sayHello = partial(greet, 'Hello');
// var sayHi = partial(greet, 'Hi');
//
// // sayHello('Brandon');
// // sayHi('Sarah');
//
// function subtract(a, b) {
//   return a - b;
// }
//
// // function sub5(a) {
// //   return subtract(a, 5);
// // }
//
// function makeSubN(n) {
//   return function(a) {
//     return subtract(a, n);
//   };
// }
//
// var sub5 = makeSubN(5);
//
// // console.log(sub5(10));
// // console.log(sub5(20));
//
// function makePartialFunc(func, b) {
//   return function(a) {
//     return func(a, b);
//   };
// }
//
// function multiply(a, b) {
//   return a * b;
// }
//
// var multiplyBy5 = makePartialFunc(multiply, 5);

// console.log(multiplyBy5(100));


function subtract(a, b) {
  return a - b;
}

function sub5(a) {
  return subtract(a, 5);
}

console.log(sub5(10)); // 5
console.log(sub5(20)); // 15

// Stage 2 -

function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  return function(a) {
    return subtract(a, n);
  };
}

var sub5 = makeSubN(5);
console.log(sub5(10)); // 5

// Stage 3 -

function subtract(a, b) {
  return a - b;
}

function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b);
  };
}

var sub5 = makePartialFunc(subtract, 5);
console.log(sub5(20)); // 15
