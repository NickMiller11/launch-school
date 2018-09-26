/*

1
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

foo = new Foo(); // logs 2 since method bar() is invoked when constructing the object

foo.bar(); // logs 2 by calling bar() directly
Foo(); // logs 2 because we're calling Foo() in the global context, which changes
       // the global a to 2, and logs 2 by calling the bar() method

obj = {};
Foo.call(obj);  // adds the a property and bar method to the obj and calls bar() to
                // log 2 to the console
obj.bar();      // logs 2 by calling the bar() method directly on the obj, which has
                // a property a set to 2

console.log(this.a);  // logs 2 because the global a has been changed to 2

// I got this very wrong at first.  This logs the number 2 six times.


2
What does the following code log to the console?

*/

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
  this.area = RECTANGLE.area.call(this);
  this.circumference = RECTANGLE.circumference.call(this);
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area); // logs 6
console.log(rect1.circumference); // logs 10

// I was wrong, this actually naturally logs NaN for both, becuase when the RECTANGLE
// object returns the area and circumference, the 'this' is set to the RECTANGLE object
// not the Rectangle constructor function.  Specifically using 'call' on the methods
// in the Rectangle constructor function fixes this.
