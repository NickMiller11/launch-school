function pop(arr) {
  lastValue = arr[arr.length - 1];
  arr.length = arr.length - 1;
  return lastValue;
}

var count = [1, 2, 3];
console.log(pop(count));             // 3
console.log(count);                  // [ 1, 2 ]