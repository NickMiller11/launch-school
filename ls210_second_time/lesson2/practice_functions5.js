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

var temperatures = [84, 80, 77, 76, 76];

console.log(average(temperatures));
