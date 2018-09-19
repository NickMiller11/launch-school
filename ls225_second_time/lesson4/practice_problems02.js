/*

1
Create a makeCounterLogger function that takes a number as an argument and returns a function.
When we invoke the returned function with a second number, it should count up or down from the
first number to the second number, logging each number to the console:

> var countlog = makeCounterLogger(5);
> countlog(8);
5
6
7
8
> countlog(2);
5
4
3
2

function makeCounterLogger(num1) {
  return function(num2) {
    var i;

    if (num1 < num2) {
      for (i = num1; i <= num2; i += 1) {
        console.log(i);
      }
    } else if (num1 > num2) {
      for (i = num1; i >= num2; i -= 1) {
        console.log(i);
      }
    }
  }
}

var countlog = makeCounterLogger(5);
countlog(8);
countlog(2);


2
We'll build a simple todo list program using the techniques we've seen in this assignment.
Write a makeList function that returns a new function that implements a todo list.
The returned function should have the following behavior:

When called with an argument that is not already on the list, it adds that argument to the list.

When called with an argument that is already on the list, it removes the element from the list.

When called without arguments, it logs all items on the list. If the list is empty, it logs an
appropriate message.

> var list = makeList();
> list();
The list is empty.
> list('make breakfast');
make breakfast added!
> list('read book');
read book added!
> list();
make breakfast
read book
> list('make breakfast');
make breakfast removed!
> list();
read book

*/
function makeList() {
  return function(arg) {
    var list = [];
    var i = list.indexOf(arg);

    if (arg === undefined) {
      list.forEach(function (item) {
        console.log(item);
      });

      if (list.length === 0) {
        console.log('The list is empty.');
      }
    } else if (i === -1) {
      list.push(arg);
      console.log(arg + ' added!');
    } else if (i !== -1) {
      list.splice(i, 1);
      console.log(arg + ' removed!');
    }
  };
}

var list = makeList();
list();

