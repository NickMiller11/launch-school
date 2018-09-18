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
*/