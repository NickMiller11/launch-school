function forwardReverse(arr) {
  var forward = arr.slice(0);
  var newArr = [];

  newArr = forward.concat(arr.reverse());
  return newArr;
}

console.log(forwardReverse([1, 2, 3]));