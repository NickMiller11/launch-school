function createString(arr) {
  var i;
  var newString = '';

  for (i = 0; i < arr.length; i += 1) {
    newString += arr[i].toString();
  }

  return newString;
}

console.log(createString([1, 'a', 44]));
