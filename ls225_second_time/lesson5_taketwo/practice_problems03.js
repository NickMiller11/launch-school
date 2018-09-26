/*

1
Use the method we learned above to assign foo below to a new Object with prot as its prototype.

var prot = {};

var foo = // ?

--->
var foo = Object.create(prot);


2
Use getPrototypeOf to demonstrate the prototypal relationship between prot and foo.

-->
console.log(Object.getPrototypeOf(foo) === prot);


4
Use isPrototypeOf to demonstrate the prototypal relationship between prot and foo.

--->
console.log(prot.isPrototypeOf(foo));

5
What will the last two lines of the code below return? Why?

var prot = {};

var foo = Object.create(prot);

prot.isPrototypeOf(foo);
Object.prototype.isPrototypeOf(foo);

--->
Both will return true, because both prot and Object.prototype are on foo's
prototype chain.
*/

var prot = {};
var foo = Object.create(prot);
console.log(Object.getPrototypeOf(foo) === prot);
console.log(prot.isPrototypeOf(foo));
