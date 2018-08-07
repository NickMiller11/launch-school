function unshift(arr, value) {
  var i

  for (i = arr.length; i > 0; i--) {
    arr[i] = arr[i - 1];
  }

  arr[0] = value;
  return value;
}

var count = [1, 2, 3];
console.log(unshift(count, 0));      // 4
console.log(count);                  // [ 0, 1, 2, 3 ]