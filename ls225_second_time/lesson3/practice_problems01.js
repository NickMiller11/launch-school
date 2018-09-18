/*
1
The global object is the implicit execution context.  For browsers, this is window.
For node, this is global.

2
This is true

3
What does the code below log?

function func() {
  var b = 1;
}

func();

console.log(b);

--> This raises a reference error since the variable b is in the function scope.

4
What does the code below log?

function func() {
  b = 1;
}

func();

console.log(b);

--> This logs 1.  Since b is initialized with the implicit context of the global object, it
is accessible on the global scope.

5
Of the variables a, b, and c below, can any be successfully deleted?

var a = 1;
b = 'Hi there';
var c = '-50';

delete a; // => ?
delete b; // => ?
delete c; // => ?

--> variable b can be successfully deleted since the variable is initialized but not
declared

6
In the code below, will we be able to delete func?

function func() {
  console.log("I'm a function!");
}

delete func; // => ?

--> No, this will not be deleted because the function is being declared

7
Of the variables a, b, and c below, can any be deleted?

window.a = 1;
b = 2;
var c = b;

delete window.a; // => ?
delete window.b; // => ?
delete window.c; // => ?

--> I believe a and b can be deleted.  Global variables added explicitly to the
global object as a property can be deleted
*/