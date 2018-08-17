function reversed(arr) {
  var i;
  var newArr = [];
  for (i = arr.length - 1; i >= 0; i -= 1) {
    newArr[newArr.length] = arr[i];
  }

  return newArr;
}

console.log(reversed([1, 2, 3, 4, 5]));
