function lastIndexOf(arr, value) {
  var i;
  var index = -1;

  for (i = 0; i < arr.length; i += 1) {
    if (arr[i] === value) {
      index = i;
    }
  }

  return index;
}

console.log(lastIndexOf([1, 2, 3, 3], 3));     // 3
console.log(lastIndexOf([1, 2, 3], 4));        // -1
