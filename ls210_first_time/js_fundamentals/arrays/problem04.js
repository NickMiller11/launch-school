function concat() {
  var newArr = [];
  var i;
  var j;

  for (j = 0; j < arguments.length; j++) {
    if (Array.isArray(arguments[j])) {
      for (i = 0; i < arguments[j].length; i++) {
        newArr.push(arguments[j][i]);
      }
    } else {
      newArr[newArr.length] = arguments[j];
    }
  }

  return newArr;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]