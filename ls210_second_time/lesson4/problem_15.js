// input - array
// output - array

// rules:
// - return a new array that includes all missing integers between the first and
//   last elements of the input array

// algorithm:
// - declare variables for start and end elements of the input array
// - declare an index variable
// - create a for loop and set i to start (while i is less than end)
//   - if i is included in arr[i], continue
//   - push i to newArr
// - return newArr


function missing(arr) {
  var start = arr[0] + 1;
  var end = arr[arr.length - 1];
  var i;
  var newArr = [];

  for (i = start; i < end; i += 1) {
    if (arr.includes(i)) {
      continue;
    }

    newArr.push(i);
  }

  return newArr;
}

console.log(missing([-3, -2, 1, 5]));
console.log(missing([1, 2, 3, 4]));
console.log(missing([1, 5]));
console.log(missing([6]));