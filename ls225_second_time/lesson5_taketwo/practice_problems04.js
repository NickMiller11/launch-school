/*

1
What will the code below log to the console?

var foo = {};
var bar = Object.create(foo);

foo.a = 1;

console.log(bar.a);


---> This wil log 1 since bar can access foo's properties.

2
What will the code below log to the console?

var foo = {};
var bar = Object.create(foo);

foo.a = 1;
bar.a = 2;
console.log(bar.a);

---> This will log 2 since bar's a property shadows foo's a property

3
Given the code below, do we know for certain that on the last line we are
ultimately referencing a property owned by boo? How can we test that far is
not delegating to boo?

var boo = {};
boo.myProp = 1;

var far = Object.create(boo);

// lots of code

far.myProp;       // 1

---> we could use far.hasOwnProperty('myProp') to check
*/
