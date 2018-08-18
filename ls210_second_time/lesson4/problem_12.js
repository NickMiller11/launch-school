function sortDescending(arr) {
  var sortedArr = arr.slice(0);

  return sortedArr.sort(function (a, b) {
    return b - a;
  });
}

var array = [23, 4, 16, 42, 8, 15];
var result = sortDescending(array);
console.log(result);
console.log(array);