function findIndex(value, arr) {
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

console.log(findIndex('c', ['a', 'b', 'c', 'd']));
console.log(findIndex('a', ['a', 'b', 'c', 'd']));
console.log(findIndex('e', ['a', 'b', 'c', 'd']));
console.log(findIndex('d', ['a', 'b', 'c', 'd']));
