function lastNOf(arr, count) {
  var len = arr.length;

  if (count > len) {
    count = len;
  }

  return arr.slice(len - count)
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(lastNOf(digits, 9));