/*

1
What naming convention separates constructor functions from other functions?

--> The name of the constructor function is capitalized.

2
What will the code below output? Why?

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = Lizard();
lizzy.scamper(); // ?

--> This logs an error because scamper is now a property of the window object

3
Alter the code in problem 2 so that it produces the desired output.

--->  Added a 'new' in front of the Lizard function invocation

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = new Lizard();
lizzy.scamper(); // ?
*/
