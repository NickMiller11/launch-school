// input: positive integer
// output: right triangle displayed to console

// rules: the right triangle displayed should have the hypotenuse running from the
// upper right to lower left, with the stars on the right side

// pseudo code:
// - declare a var for i
// - while i is less than or equal to the num
//   - display num - i spaces and i stars
//   - increment i

function spaces(max, stars) {
  var spacesString = '';
  var spaces = max - stars
  while (spacesString.length < spaces) {
    spacesString += ' ';
  }

  return spacesString;
}

function triangle(num) {
  var i
  var starsString = ''
  for (i = 1; i <= num; i++) {
    starsString += '*';
    console.log(spaces(num, i) + starsString);
  }
}

triangle(5);
triangle(9);