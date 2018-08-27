function totalSquareArea(rectangles) {
  var squares;

  squares = rectangles.filter(function (shape) {
    return shape[0] === shape[1];
  });

  squares = squares.map(function (square) {
    return Math.pow(square[0], 2);
  })

  return squares.reduce(function (area, nextSquare) {
    return area + nextSquare;
  })

}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles));    // 121