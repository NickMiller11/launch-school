function indexOf(arr, value) {
  var i;
  var index = -1;

  for (i = 0; i < arr.length; i += 1) {
    if (arr[i] === value) {
      index = i;
      break;
    }
  }

  return index;
}

console.log(indexOf([1, 2, 3, 3], 3));         // 2
console.log(indexOf([1, 2, 3], 4));            // -1
