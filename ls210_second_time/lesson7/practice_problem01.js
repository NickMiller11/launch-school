// input - array, function
// output - undefined
//
// rules:
// - write a function that iterates over the input array and applies the input
//   function to each value
//
// algorithm:
// - iterate over the input array, passing each value to the input function
// - don't use the return value


function myForEach(array, func) {
  var i;

  for (i = 0; i < array.length; i += 1) {
    func(array[i]);
  }
}

var min = Infinity;
var getMin = function (value) {
  min = value <= min ? value : min;
};

console.log(myForEach([4, 5, 12, 23, 3], getMin));    // undefined
console.log(min);                        // 3
