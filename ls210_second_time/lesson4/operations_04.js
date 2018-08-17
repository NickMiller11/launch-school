function shift(arr) {
  var i;
  var value = arr[0];

  for (i = 0; i < arr.length; i += 1) {
    arr[i] = arr[i + 1];
  }

  arr.length -= 1;
  return value;
}

var count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]
