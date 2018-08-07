function missing(arr) {
  var start = arr[0] + 1;
  var end = arr[arr.length - 1];
  var i
  var newArr = [];

  for (i = start; i < end; i++) {
    if (arr.indexOf(i) === -1) {
      newArr.push(i);
    }
  }

  return newArr;
}


console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []