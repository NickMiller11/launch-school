/*

1
What naming convention separates constructor functions from other functions?

--> The first letter of the function is capitalized

2
What will the code below output? Why?

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = Lizard();
lizzy.scamper(); // ?

--> I'm not sure what it outputs, but it doesn't look like it outputs what it should
Turns out this returns a typeerror, becuase the return value of the Lizard function
is undefined since it doesn't explicitely return a value.

3
Alter the code in problem 2 so that it produces the desired output.

*/

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = new Lizard();
lizzy.scamper(); // ?
