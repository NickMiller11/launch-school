function myOwnEvery(array, func) {
  var i;

  for (i = 0; i < array.length; i += 1) {
    if (!isAString(array[i])) {
      return false;
    }
  }

  return true;
}

var isAString = function (value) {
  return typeof value === 'string';
};

console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true