/*

1
Is JavaScript a garbage-collected language, and if so, what does this entail?

--> Yes, JS is a garbage-collected language.  This means that the language will allocate
space in memory as needed, as well as automatically try to determine when values can be
garbage-collected rather than have the user perform those tasks.

2
Consider the code below:

var myNum = 1;

function foo() {
  var myStr = 'A string';
  // what is eligible for GC here?
}

foo();

// what is eligible for GC here?

// more code

Are either of the values 1 or "A string" eligible
for garbage collection on line 5? What about on line 10?

--> myNum hasn't been used yet, so it is not eligible for garbage collection
myStr is eligible for GC after the function foo() is invoked.

3
In the code below, is the value referenced by outerFoo eligible for garbage
collection on line 10?

var outerFoo;

function bar() {
  var innerFoo = 0;
  outerFoo = innerFoo;
}

bar();

// can outerFoo's 0 be garbage collected here?

// more code

--> no, the value referenced by outerFoo cannot be GC'd after bar() has run because
it is a global variable

4
Consider the code below:

function makeEvenCounter() {
  var index = 0;
  return function() {
    return index += 2;
  };
}

var evenCounter = makeEvenCounter();

// is 0 eligible for GC here?

// more code
Is 0 eligible for garbage collection on line 10?

--> no, 0 is not eligible for GC because of closure created on the function returned
by makeEvenCounter prevents it

5
Consider the script below:

var bash = "Some val";
Will the value "Some val" ever be eligible for garbage collection?

--> yes, if the program ends or bash is reassigned to another value