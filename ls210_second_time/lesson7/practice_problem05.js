function myOwnEvery(array, func) {
  var i;

  for (i = 0; i < array.length; i += 1) {
    if (!func(array[i])) {
      return false
    }
  }

  return true;
}

var isAString = function (value) {
  return typeof value === 'string';
};

console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true
console.log(myOwnEvery(['a', 4, '1abc'], isAString));       // false
