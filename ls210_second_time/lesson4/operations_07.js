function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

function slice(arr, start, end) {
  var i = start;
  var newArray = [];

  for (; i < end; i += 1) {
    push(newArray, arr[i]);
  }

  return newArray;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]
