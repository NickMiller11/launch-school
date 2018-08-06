
// input: three integers between 0 and 100
// output: string char

// rules: output a letter grade based on the average of the three input integers

// pseudo code:
// - declare a variable for the average
// - calculate the average and assign to variable
// - create an if statement to return the correct grade

function getGrade(num1, num2, num3) {
  var average = (num1 + num2 + num3) / 3;

  if (average >= 90) {
    return 'A';
  } else if (average >= 80) {
    return 'B';
  } else if (average >= 70) {
    return 'C';
  } else if (average >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

console.log(getGrade(95, 90, 93));    // "A"
console.log(getGrade(50, 50, 95));    // "D"