/*

In the following code, when can JavaScript garbage collect the values represented
by the variables a, b, and c?

var a = 34;

function add(b) {
  a += b;
}

function run() {
  var c = add(4);
}

run();

--> variables can be GC'd:
a = when the program finishes running
b = as soon as the add funciton finishes running
c = as soon as the run function returns

2
In the following code, when can JavaScript garbage collect the value "Steve"?

function makeHello(name) {
  return function() {
    console.log("Hello, " + name + "!");
  };
}

var helloSteve = makeHello("Steve");

--> "Steve" can be GC'd after the program finishes (after the function referenced
by helloSteve is GC'd)
