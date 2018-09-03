// For this practice problem, we'll represent rectangles as Arrays with two elements:
// a height and a width.
//
// Write a Function named totalArea that takes an Array of rectangles as an argument.
// The Function should return the total area covered by all the rectangles.

// input - array of subarrays
// output - number
//
// rules:
// - return the sum of the products of the numbers in each subarrays
//
// algorithm:
// - iterate over each array using #map and change each subarray to the
//   product of its numbers
// - use reduce to sum up all those numbers

function totalArea(rectangles) {
  return rectangles.map(function (rectangle) {
    return rectangle[0] * rectangle[1];
  }).reduce(function (sumOfAreas, area) {
    return sumOfAreas + area;
  });
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141

// Now, write a second Function named totalSquareArea.
// This Function should calculate the total area of a set of rectangles,
// just like totalArea. However, it should only include squares in its calculations:
// it should ignore rectangles that aren't square.

function totalSquareArea(rectangles) {
  var squares = rectangles.filter(function (shape) {
    return shape[0] === shape[1];
  });

  return totalArea(squares);
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles));    // 121
