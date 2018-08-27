function totalArea(rectangles) {
  var areas;

  areas = rectangles.map(function (sides) {
    return sides[0] * sides[1];
  });

  return areas.reduce(function (previousValue, element) {
    return previousValue + element;
  });
}


var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141