function concat(arr1, arr2) {
  var newArr = arr1;
  var i

  for (i = 0; i < arr2.length; i++) {
    push(newArr, arr2[i]);
  }

  return newArr;
}

function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]