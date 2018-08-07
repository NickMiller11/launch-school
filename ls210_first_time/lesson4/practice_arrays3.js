function oddElementsOf(arr) {
  var newArr = [];
  var i

  for (i = 0; i < arr.length; i++) {
    if (i % 2 !== 0) {
      newArr.push(arr[i]);
    }
  }

  return newArr;
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(oddElementsOf(digits));    // returns [8, 16, 42]


function combinedArray(even, odd) {
  var newArr = [];
  var i

  for (i = 0; i < even.length; i++) {
    newArr.push(even[i]);
    newArr.push(odd[i]);
  }

  return newArr;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];
console.log(combinedArray(digits, letters));  // returns [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]


function forwardReverse(arr) {
  var newArr = [];
  var len = arr.length;
  var i

  for (i = 0; i < len; i++) {
    newArr.push(arr[i]);
  }

  for (i = len - 1; i >= 0; i--) {
    newArr.push(arr[i]);
  }

  return newArr;
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(forwardReverse(digits));  // returns [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]

// The same functionality can also be achieved with:

function forwardReverse(arr) {
  return arr.concat(arr.slice().reverse());
}


function sortDescending(arr) {
  var newArr = arr.slice();
  return newArr.sort(function (a, b) { return b - a; });
}

var array = [23, 4, 16, 42, 8, 15];
var result = sortDescending(array);  // returns [42, 23, 16, 15, 8, 4]
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]


function matrixSums(arr) {
  var i
  var j
  var sum
  var newArr = [];

  for (i = 0; i < arr.length; i++) {
    sum = 0;

    for (j = 0; j < arr[i].length; j++) {
      sum += arr[i][j];
    }

    newArr.push(sum);
  }

  return newArr;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]


function uniqueElements(arr) {
  var i
  var newArr = [];

  for (i = 0; i < arr.length; i++) {
    if (newArr.includes(arr[i])) {
      continue;
    } else {
      newArr.push(arr[i]);
    }
  }

  return newArr;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]