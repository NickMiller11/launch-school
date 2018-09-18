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

// var a = 10;
// var obj = {
//   a: a,
// }

// var newObj = obj;
// newObj.a += 10;

// console.log(obj.a === a);
// console.log(newObj === obj);

// The first statement will log false because the a inside the object will be 20 and the a in the global scope
// will be 10

// The second statement will log true because both pointers are referencing the same object.

var animal = {
  name: 'Pumbaa',
  species: 'Phacochoerus africanus',
};

var menagerie = {
  warthog: animal,
};

animal = {
  name: 'Timom',
  species: 'Suricata suricatta',
};

menagerie.meerkat = animal;

menagerie.warthog === animal; // false
menagerie.meerkat === animal; // true

// I believe the reason when the second to last line returns false is that when animal is reassigned to a
// new object, it doesn't change the animal object that the warthog property was assigned to.
// I was correct, animal is reassigned to a new object, not mutated.