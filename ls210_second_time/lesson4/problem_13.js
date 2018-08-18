function matrixSums(arr) {
  var newArr = [];
  var i;

  for (i = 0; i < arr.length; i += 1) {
    newArr.push(arr[i].reduce(
      ( accumulator, currentValue ) => accumulator + currentValue,
    0));
  }

  return newArr;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));