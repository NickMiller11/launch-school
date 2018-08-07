function slice(array, begin, end) {
  var i
  var finalArr = [];

  if (end > array.length) {
    end = array.length;
  } else if (begin > array.length) {
    begin = array.length;
  }

  for (i = begin; i < end; i++) {
    finalArr.push(array[i])
  }

  return finalArr;
}

// console.log(slice([1, 2, 3], 1, 2));               // [2]
// console.log(slice([1, 2, 3], 2, 0));               // []
// console.log(slice([1, 2, 3], 5, 1));               // []
// console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

// var arr = [1, 2, 3];
// console.log(slice(arr, 1, 3));                     // [2, 3]
// console.log(arr);                                  // [1, 2, 3]

// Wow, this splice method got squirrly real quick.  Work through it thoroughly
// on my second pass of the material.

function splice(array, start, deleteCount, element1, elementN) {
  var deletedValues = slice(array, start, start + deleteCount);
  var i

  for (i = start; i < start + deleteCount; i++) {
    array[i] = array[i + deleteCount];
  }

  array.length = array.length - deleteCount;

  array.length += arguments.length - 3

  for (i = start; i < start + deleteCount; i++) {
    array[i + (arguments.length - 3)] = array[i];
  }


  return deletedValues;
}

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
splice([1, 2, 3], 1, 3);              // [2, 3]
splice([1, 2, 3], 1, 0);              // []
splice([1, 2, 3], 0, 1);              // [1]
splice([1, 2, 3], 1, 0, 'a');         // []

var arr = [1, 2, 3];
console.log(splice(arr, 1, 1, 'two'));             // [2]
console.log(arr);                                  // [1, "two", 3]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr);                                  // [1, "two", "three"]

var arr = [1, 2, 3];
splice(arr, 1, 0);                    // []
splice(arr, 1, 0, 'a');               // []
arr;                                  // [1, "a", 2, 3]

var arr = [1, 2, 3];
splice(arr, 0, 0, 'a');               // []
arr;                                  // ["a", 1, 2, 3]