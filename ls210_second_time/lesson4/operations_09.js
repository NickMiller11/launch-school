function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

function concat(arr1, arr2) {
  var i;
  var newArr = [];

  for (i = 0; i < arr1.length; i += 1) {
    push(newArr, arr1[i]);
  }

  for (i = 0; i < arr2.length; i += 1) {
    push(newArr, arr2[i]);
  }

  return newArr;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
