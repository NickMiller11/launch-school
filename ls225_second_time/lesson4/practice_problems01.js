/*

1
What are the characteristics that define higher-order functions?

--> a higher order function either takes a function as an argument, or returns a function
(or both)

2
Consider the code below:

var numbers = [1, 2, 3, 4];
function checkEven(number) {
  return number % 2 === 0;
}

numbers.filter(checkEven); // [2, 4]

Of the two functions invoked (checkEven and filter),
which is a higher-order function and why?

--> filter is the higher-order function because it takes the checkEven function
as an argument

3
Implement makeCheckEven below, such that the last line of the code returns an array [2, 4].

var numbers = [1, 2, 3, 4];
function makeCheckEven() {
  return function(number) {
    return number % 2 === 0;
  };
}

var checkEven = makeCheckEven();

console.log(numbers.filter(checkEven));

4
Implement execute below, such that the return values for the two function invocations
match the commented values.

function execute(func, operand) {
  return func(operand);
}

console.log(execute(function(number) {
  return number * 2;
}, 10)); // 20

console.log(execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy')); // "HEY THERE BUDDY"

5
Implement makeListTransformer below such that timesTwo's return value matches the commented return value.

function makeListTransformer(func) {
  return function(collection) {
    return collection.map(func);
  };
}

var timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

console.log(timesTwo([1, 2, 3, 4])); // [2, 4, 6, 8]

--> I'M NOT REALLY SURE HOW NUMBER 5 WORKS

*/

