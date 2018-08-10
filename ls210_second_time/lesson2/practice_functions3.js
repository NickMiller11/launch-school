function average(arr) {
  return sum(arr) / arr.length;
}

function sum(arr) {
  var total = 0;
  var i;

  for (i = 0; i < arr.length; i += 1) {
    total += arr[i];
  }

  return total;
}

console.log(average([2, 5, 7, 9, 48]));
