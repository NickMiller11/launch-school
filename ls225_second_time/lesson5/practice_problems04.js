/*
1
What will the code below log to the console?

var foo = {};
var bar = Object.create(foo);

foo.a = 1;

console.log(bar.a);

--> This will log 1 to the console, as bar can access the 'a' property via
prototypal inheritance


2
What will the code below log to the console?

var foo = {};
var bar = Object.create(foo);

foo.a = 1;
bar.a = 2;
console.log(bar.a);

--> This will log 2, because it is the first property 'a' found


3
Given the code below, do we know for certain that on the last line we are
ultimately referencing a property owned by boo? How can we test this?

var boo = {};
boo.myProp = 1;

var far = Object.create(boo);

// lots of code

far.myProp;       // 1

--> No, we don't know if the 'myProp' method is a property owned by boo.  We
can either use far.hasOwnProperty('myProp') or Object.getOwnPropertyNames(far)
to check.
