function arraysEqual(arr1, arr2) {
  var i;

  if (arr1.length !== arr2.length) {
    return false;
  }

  for (i = 0; i < arr1.length; i += 1) {
    if (arr1[i] !== arr2[i]) {
      return false;
    }
  }

  return true;
}

console.log(arraysEqual([1], [1]));
console.log(arraysEqual([1], [2]));
console.log(arraysEqual([1, 2], [1, 2, 3]));
console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]));
console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]));
console.log(arraysEqual([1, 'hi', true], [1, 'hello', true]));
console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]));
