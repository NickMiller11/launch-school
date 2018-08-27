function sum(num) {
  var numArray = String(num).split('');

  return numArray.reduce(function (total, digit) {
    return parseInt(total, 10) + parseInt(digit, 10);
  });
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45