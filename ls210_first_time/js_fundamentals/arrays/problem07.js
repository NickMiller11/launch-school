
function shift(arr) {
  var i
  var result = arr[0];

  if (arr.length === 0) {
    return undefined;
  }

  for (i = 0; i < arr.length - 1; i++) {
    arr[i] = arr[i + 1];
  }

  arr.length = arr.length - 1;
  return result;
}


function unshift(arr) {
  var i
  var len = arr.length;
  len += 1;

  for (i = len - 1; i >= 0; i--) {
    arr[i] = arr[i - 1];
  }

  arr[0] = value;

  return len;
}


console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

var testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]