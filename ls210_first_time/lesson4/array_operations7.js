function slice(arr, start, end) {
  var newArr = [];

  for (; start < end; start++) {
    push(newArr, arr[start]);
  }

  return newArr;
}

function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]