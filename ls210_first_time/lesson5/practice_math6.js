function randomBetween(min, max) {
  if (min === max) {
    return min;
  }

  var difference = Math.abs(max - min);
  var randomNum = Math.round(difference * Math.random() + min);
  return randomNum;
}

console.log(randomBetween(3, 10));