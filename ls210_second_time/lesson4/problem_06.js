function lastNOf(arr, count) {
  len = arr.length
  return arr.slice(len - count)
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(lastNOf(digits, 3));

// if you pass in a count greater than the array, it will return an empty array
// as per the `slice` documentation.

console.log(lastNOf(digits, 9));

// Nope!  I forgot to consider that `slice` will be called with a negative index,
// which will offset that many positions from the end of the array.