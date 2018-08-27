function multiplyAllPairs(arr1, arr2) {
  var newArray = [];

  arr1.forEach(function (num1) {
    arr2.forEach(function (num2) {
      newArray.push(num1 * num2)
    } )
  })

  return newArray.sort(sortNumbers);
}

function sortNumbers(num1, num2) {
  return num1 - num2;
  // if (num1 > num2) {
  //   return 1;
  // } else if (num1 < num2) {
  //   return -1;
  // } else {
  //   return 0;
  // }
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]