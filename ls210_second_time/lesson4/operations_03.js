function unshift(arr, value) {
  var i;

  arr.length += 1;
  for (i = arr.length - 2; i >= 0; i -= 1) {
    arr[i + 1] = arr[i];
  }

  arr[0] = value;
  return arr.length;
}

var count = [1, 2, 3];
console.log(unshift(count, 0));      // 4
console.log(count);                  // [ 0, 1, 2, 3 ]
