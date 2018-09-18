/*

1
What will the code below output?

function func() {
  return this;
}

var context = func();

console.log(context);

--> this code will output '[object Window]'

2
What will the code below output? Explain the difference,
if any, between this output and that of problem 1.

var o = {
  func: function() {
    return this;
  },
};

var context = o.func();

console.log(context);

--> this code will output '[object Window]' because the method is being assigned
to a global variable

Actually, I got this wrong.  The method is being called and the return value is
being assigned to the variable context.  I thought that context was being bound
to the function itself, but it's actually the return value instead.  The object
itself is returned { func: [Function: func] }

*/

// Messing around to find the intricacies of question 2
var o = {
  func: function() {
    return this;
  },
};

var context = o.func();

console.log(context);

var foo = {
  bar: function () {
    return this;
  },
  test: 'test',
};

console.log(foo.bar());
// var a = foo.bar();
// console.log(a);

/*

3
What will the code below output?

var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage();

var foo = {
  message: 'Hello from the function scope!',
};

foo.deliverMessage = deliverMessage;

foo.deliverMessage();

--> This will output:
"Hello from the global scope!"
"Hello from the function scope!"

4
What will the code below output?

var a = 10;
var b = 10;
var c = {
  a: -10,
  b: -10,
};

function add() {
  return this.a + b;
}

c.add = add;

console.log(add());
console.log(c.add());

--> This will output:
20 (adding global variable a and global variable b together)
0 (adding c.a and global variable b together)

5
The problems above all feature implicit function execution context.
What methods have we learned so far that allow us to explicitly specify
what a function's execution context should be?

--> call and apply

6
In the code below, use call to invoke add as a method on bar but with foo as
execution context. What will this return?

var foo = {
  a: 1,
  b: 2,
};

var bar = {
   a: 'abc',
   b: 'def',
   add: function() {
     return this.a + this.b;
   },
};

--> bar.add.call(foo)
This will return 3.
*/

// 7
// Given the code and desired output below, would it make more sense to use call
// or apply to supply explicit context and arguments to outputList? Implement a
// solution using one of the methods, such that the desired output is logged, and
// explain your choice.

var fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};


function outputList() {
  console.log(this.title + ':');

  var args = [].slice.call(arguments);

  args.forEach(function(elem) {
    console.log(elem);
  });
}

outputList.apply(fruitsObj, fruitsObj.list);

// Desired output:
//
// A Collection of Fruit:
// Apple
// Banana
// Grapefruit
// Pineapple
// Orange

// 8
// For an extra challenge, consider this line of code from the previous problem:

var args = [].slice.call(arguments);

// Inside of JavaScript functions, arguments is an object that holds all of the 
// arguments passed to the function. Bearing in mind that the function author wants
// to iterate over the arguments later in the method using an Array method, why do
// you think he or she is invoking call?
