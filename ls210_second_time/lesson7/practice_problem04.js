// if the function is called with an initial value,
// then the accumulator should be set to this initial value
// and callbacks should start by passing in the value at array[0]
//
// if not, then the accumulator should be set to the first value and callbacks should
// start by passing in the value at array[1]

function myReduce(array, func, initial) {
  var accumulator = initial ? initial : array[0];

  if (!initial) {
    array = array.slice(1);
  }

  array.forEach(function (value) {
    accumulator = func(accumulator, value);
  });

  return accumulator;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
