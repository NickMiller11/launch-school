/*

1
Will the code below execute?

function() {
  console.log("Sometimes, syntax isn't intuitive!")
}();

--> This will log an error

2
Edit the code from problem one so it executes without error.

(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();

3
The code below throws an error:

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
}

sum += sum(numbers);  // ?
What kind of problem does this error highlight? Use an IIFE to address it,
so that code runs without error.

--> This problem highlights problems with variable naming, specifically a variable and
a function want to use the same name.

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];


console.log(sum += (function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers));  // ?


4
Consider the output below:

countdown(7);
7
6
5
4
3
2
1
0
Done!

Implement a function countdown that uses an IIFE to generate the desired output.

function countdown(num) {
  (function() {
    var i;

    for (i = num; i >= 0; i -= 1) {
      console.log(i);
    }

    console.log('Done!');
  })();
}

countdown(7);



5
Is the named function inside in this IIFE accessible in the global scope?

(function foo() {
  console.log('Bar');
})();

foo() // ?

--> No, it has it's own scope



6
For an extra challenge, refactor the solution to problem 4 using recursion,
bearing in mind that a named function created in an IIFE can be referenced
inside of the IIFE.

function countdown(num) {
  (function() {
    if (num < 0) {
      console.log('Done!');
      return;
    }

    console.log(num)

    countdown(num - 1);
  })();
}

countdown(7);
*/

