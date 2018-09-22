/*

1
Use the method we learned above to assign foo below to a new Object with prot as its prototype.

var prot = {};

var foo = // ?

--> var foo = Object.create(prot);


2
Use getPrototypeOf to demonstrate the prototypal relationship between prot and foo.

--> Object.getPrototypeOf(foo) === prot


3
Use isPrototypeOf to demonstrate the prototypal relationship between prot and foo.

--> prot.isPrototypeOf(foo)


4
What will the last two lines of the code below return? Why?

var prot = {};

var foo = Object.create(prot);

-->
prot.isPrototypeOf(foo);  // true
Object.prototype.isPrototypeOf(foo); // true

*/
