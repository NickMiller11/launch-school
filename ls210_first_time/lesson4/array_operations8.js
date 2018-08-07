function splice(arr, start, remove) {
  var i
  var j
  var newArr = [];

  for (i = start, j = start + remove; i < start + remove; i++, j++) {
    push(newArr, arr[i]);
    arr[i] = arr[j];
  }

  arr.length = arr.length - remove;
  return newArr;
}

function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

var count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]