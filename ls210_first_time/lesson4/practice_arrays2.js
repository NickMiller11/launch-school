function firstElementOf(arr) {
  return arr[0];
}

console.log(firstElementOf(['U', 'S', 'A']));  // returns "U"


function lastElementOf(arr) {
  return arr[arr.length - 1];
}

console.log(lastElementOf(['U', 'S', 'A']));  // returns "A"


function nthElementOf(arr, index) {
  return arr[index];
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(nthElementOf(digits, 3));   // returns 16
console.log(nthElementOf(digits, 8));   // what does this return?
console.log(nthElementOf(digits, -1));  // what does this return?


function firstNOf(arr, count) {
  var newArr = [];
  var i

  for (i = 0; i < 3; i++) {
    newArr.push(arr[i]);
  }

  return newArr;
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3));    // returns [4, 8, 15]


function lastNOf(arr, count) {
  if (count > arr.length) {
    return arr;
  } else {
    return arr.slice(arr.length - count);
  }
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]


function endsOf(beginningArr, endingArr) {
  var newArr = [beginningArr[0], endingArr[endingArr.length - 1]];
  return newArr;
}

console.log(endsOf([4, 8, 15], [16, 23, 42]));  // returns [4, 42]