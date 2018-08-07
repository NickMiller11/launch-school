function pop(arr) {
  var returnValue = arr[arr.length - 1];

  if (arr.length === 0) {
    return undefined;
  } else {
      arr.length = arr.length - 1;
  }

  return returnValue;
}

var array = [1, 2, 3];
console.log(pop(array));                        // 3
console.log(array);                // [1, 2]
console.log(pop([]));                           // undefined
console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]


function push() {
  var i;
  var j;
  var arr = arguments[0];

  for (j = 1; j < arguments.length; j++) {
      arr[arr.length] = arguments[j];
  }

  return arr.length;
}


var array = [1, 2, 3];
console.log(push(array, 4, 5, 6));              // 6
console.log(array);                // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0