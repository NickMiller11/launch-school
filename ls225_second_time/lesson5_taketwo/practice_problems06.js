/*

What does the following code log to the console?

var a = 1;
var foo;
var obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo();

foo.bar();
Foo();

obj = {};
Foo.call(obj);
obj.bar();

console.log(this.a);


--->

foo = new Foo(); // logs 2

foo.bar(); // logs 2
Foo(); // logs 2, sets global a to 2

obj = {};
Foo.call(obj); // logs 2
obj.bar(); // logs 2

console.log(this.a); // logs 2


2
What does the following code log to the console?

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  circumference: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area();
  this.circumference = RECTANGLE.circumference();
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area);
console.log(rect1.circumference);

How do you fix this problem?

---> This will log NaN to the console twice because the 'this' in RECTANGLE
will use the global object.  These functions need to be called with the 'this'
from the Rectangle function specifically.

This can be called by revising the below two methods in Rectangle:

this.area = RECTANGLE.area.call(this);
this.circumference = RECTANGLE.circumference.call(this);


3
Write a constructor function Circle, that takes a radius as an argument.
You should be able to call an area method on the created objects to get the
circle's area. Test your implementation with the following code:

var a = new Circle(3);
var b = new Circle(4);

console.log(a.area().toFixed(2)); // 28.27
console.log(b.area().toFixed(2)); // 50.27

--->
function Circle(radius) {
  this.radius = radius;
}

Circle.prototype.area = function() {
  return Math.PI * Math.pow(this.radius, 2);
}


4
What will the following code log out and why?

var ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype.swingSword = function() {
  return this.swung;
};

console.log(ninja.swingSword());


--->
logs true


5
What will the following code log out and why?

var ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype = {
  swingSword: function() {
    return this.swung;
  },
};

console.log(ninja.swingSword());

--->
I believe we'll get an error of some sort, since we're redefining the prototype
object and removing it from the prototype chain.  This will return undefined or an
error.

This is correct, it rose a typeerror because swingSword is not a function on ninja.


6
Implement the method described in the comments below:

var ninjaA;
var ninjaB;
function Ninja() {
  this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

// Add a swing method to the Ninja prototype which
// returns the calling object and modifies swung

console.log(ninjaA.swing().swung);      // this needs to be true
console.log(ninjaB.swing().swung);      // this needs to be true

--->
Ninja.prototype.swing = function() {
  this.swung = true;
  return this;
};



7
In this problem, we'll ask you to create a new instance of an object,
without having direct access to the constructor function:

var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object

console.log(ninjaB.constructor === ninjaA.constructor);    // this should be true

--->
var ninjaB = Object.create(Object.getPrototypeOf(ninjaA));

*/
