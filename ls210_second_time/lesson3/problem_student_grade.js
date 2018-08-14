// input - 3 numbers from user
// output - string logged to screen

// rules:
// - prompt user for 3 numbers
// - log a string that includes the letter grade that corresponds to the average of
//   the three numbers

// algorithm:
// - prompt the user for 3 scores
// - convert the input to integers and calculate average
// - use conditional to check average against letter grade
// - output string with letter grade to console

// function studentGrade() {
//   var grade1 = prompt('Enter score 1:');
//   var grade2 = prompt('Enter score 2:');
//   var grade3 = prompt('Enter score 3:');
//   var letterGrade;

//   var average = (Number(grade1) + Number(grade2) + Number(grade3)) / 3;

//   if (average >= 90) {
//     letterGrade = 'A';
//   } else if (average >= 70) {
//     letterGrade = 'B';
//   } else if (average >= 50) {
//     letterGrade = 'C';
//   } else {
//     letterGrade = 'F';
//   }

//   console.log('Based on the average of your 3 scores your letter grade is \"' + letterGrade + '\"');
// }



// Further Exploration

function calculateAverage(grades) {
  var i;
  var total = 0;

  for (i = 0; i < grades.length; i += 1) {
    total += grades[i];
  }

  return total / grades.length;
}

function studentGrade() {
  var grades = arguments;
  var letterGrade;
  var average = calculateAverage(grades);

  if (average >= 90) {
    letterGrade = 'A';
  } else if (average >= 70) {
    letterGrade = 'B';
  } else if (average >= 50) {
    letterGrade = 'C';
  } else {
    letterGrade = 'F';
  }

  console.log('Based on the average of your ' +
              arguments.length + ' scores your letter grade is \"' + letterGrade + '\"');
}


studentGrade(45, 98, 87, 95, 25, 33);