function uniqueElements(arr) {
  var newArr = [];
  var i;

  for (i = 0; i < arr.length; i += 1) {
    if (newArr.includes(arr[i])) {
      continue;
    }

    newArr.push(arr[i]);
  }

  return newArr;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));