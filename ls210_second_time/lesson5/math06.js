function generateRandom(min, max) {
  if (min > max) {
    var temp = min;
    min = max;
    max = temp;
  }

  return Math.floor((max - min + 1) * Math.random() + min);
}

console.log(generateRandom(3, 6));
console.log(generateRandom(0, 10));
console.log(generateRandom(10, 5));