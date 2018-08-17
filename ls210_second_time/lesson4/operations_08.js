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

function splice(arr, start, end) {
  var i;

  var newArr = slice(arr, start, start + end);

  for (i = start; i < arr.length - end; i += 1) {
    arr[i] = arr[i + end];

  }

  arr.length = arr.length - (end);

  return newArr;
}

var count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]
