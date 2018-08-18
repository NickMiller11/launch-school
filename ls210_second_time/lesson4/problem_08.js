function endsOf(beginningArr, endingArr) {
  var newArr = [];
  newArr.push(beginningArr[0]);
  newArr.push(endingArr[endingArr.length - 1]);
  return newArr;
}

console.log(endsOf([4, 8, 15], [16, 23, 42]));

// after checking the code solution, we actually don't have to create a new array
// for this.  We can just reference the elements we need, like below:

function endsOf(beginningArr, endingArr) {
 return [beginningArr[0], [endingArr.length - 1]];
}