function myMap(array, func) {

  var newArray = [];

  array.forEach(function(element) {
    newArray.push(func(element));
  });

  return newArray;
}

var plusOne = function (n) { return n + 1; };

console.log(myMap([1, 2, 3, 4], plusOne));       // [ 2, 3, 4, 5 ]