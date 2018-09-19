/*
1
What does this point to in the code below?

function whatIsMyContext() {
  return this;
}

--> don't know yet, the function hasn't been invoked

2

What does this point to in the code below?

function whatIsMyContext() {
  return this;
}

whatIsMyContext();

--> the global object, or window

3
What does this point to in the code below?

function foo() {
  function bar() {
    function baz() {
      console.log(this);
    }

    baz();
  }

  bar();
}

foo();

--> this points to the global object since it was called with the implicit global context

4
What does this point to in the code below?

var obj = {
  count: 2,
  method: function() {
    return this.count;
  },
};

obj.method();

--> this points to the object obj

5
What does the following program log to the console?

function foo() {
  console.log(this.a);
}

var a = 2;
foo();

--> 2 is logged to the console.  Foo is called with the implicit global context, so
the global variabl a is references in the console log statement.

6
What does the following program log to the console?

var a = 1;
function bar() {
  console.log(this.a);
}

var obj = {
  a: 2,
  foo: bar,
};

obj.foo();

--> this logs 2 since the function assigned to the foo property of obj is being invoked
as a method

7
What does the following code log to the console?

var foo = {
  a: 1,
  bar: function() {
    console.log(this.baz());
  },

  baz: function() {
    return this;
  },
};

foo.bar();
var qux = foo.bar;
qux();

--> this logs obj and then window.  foo.bar() is a method invokation, so this refers to the calling object
qux() is a function invokation, so this refers to the implicit global object

I was actually wrong on the second one.  Because the baz function doesn't exist on the global object,
calling qux() returns an error.

*/

var foo = {
  a: 1,
  bar: function() {
    console.log(this.baz());
  },

  baz: function() {
    return this;
  },
};

foo.bar();
var qux = foo.bar;
qux();