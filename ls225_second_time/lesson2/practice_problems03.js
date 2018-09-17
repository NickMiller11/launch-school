// var message = 'Hello from the global scope!';
//
// function func(message) {
//   message = 'Hello from the function scope!';
//   console.log(message);
// }
//
// func(message);
// console.log(message);

// this will log:
// 'Hello from the function scope!'
// 'Hello from the global scope!'

// var myObj = { message: 'Greetings from the global scope!' };
//
// function func(obj) {
//   obj.message = 'Greetings from the function scope!';
//   console.log(obj.message);
// }
//
// func(myObj);
//
// console.log(myObj.message);

// This will log 'Greetings from the function scope!' twice.
// This is because objects are mutable.  The object itself isn't being passed
// into the function, but rather a reference.  When the function is invoked,
// but obj and myObj hold different copies of the same reference to the same
// object, so any change from inside the function persists outside it.

// var message = 'Hello from the global scope!';
//
// function func() {
//   message = 'Hello from the function scope!';
//   console.log(message);
// }
//
// func();
// console.log(message);

// I think this will log:
// 'Hello from the function scope!'
// 'Hello from the global scope!' <--- this is actually the function scope again
// I forgot that variables that aren't passed into a function can be reassigned
// (unlike Ruby)

var a = 10;
var obj = {
  a: a,
}

var newObj = obj;
newObj.a += 10;

console.log(obj.a === a);
console.log(newObj === obj);
