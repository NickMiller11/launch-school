function lastInArray(arr) {
  var lastIndex = arr.length - 1
  return arr[lastIndex]
}

console.log(lastInArray([1, 2, 3, 4]));

function rollCall(arr) {
  var i;

  for (i = 0; i < arr.length; i++) {
    console.log(arr[i]);
  }
}

var names = ['Steve', 'Martha', 'Pat'];
rollCall(names);

function reverseRollCall(arr) {
  var finalArray = [];
  var i;
  for (i = arr.length - 1; i >= 0; i--) {
    finalArray.push(arr[i]);
  }

  return finalArray;
}

var numbers = [1, 2, 3, 4, 5];
console.log(reverseRollCall(numbers));

function firstIndex(value, arr) {
  var i
  var position = -1;
  for (i = 0; i < arr.length; i++) {
    if (arr[i] === value) {
      position = i;
      break;
    }
  }

  return position;
}

console.log(firstIndex(2, [1, 2, 3]));
console.log(firstIndex(9, [1, 2, 3]));

function concatString(arr) {
  var finalStr = '';
  var i

  for

}