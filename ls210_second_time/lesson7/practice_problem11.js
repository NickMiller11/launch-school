//
// input - object of students
// output - object with studentGrades and exam info
//
// rules:
// - return an object that has two keys, studentGrades and exams:
//   - the value for the studentGrades key should be an array of strings, each string
//     containing a students number grade, followed by their letter grade in parenthesis
//   - the value for the exams key should be an array of objects.
//     - Each object represents an exam, which has key/value pairs for average, minimum
//       and maximum text scores
//
// algorithm:
// - this problem is best broken down into separated bite-size chunks
// - first, calculate the student grades
//     - create the average of the exam scores
//     - calculate total exercise score
//     - multiply each by grade weight and add together
//     - round up to nearest interval int
//     - look up letter grades
//     - add both to a string and add to array
// - next, populate the exam data
//   - collect all exam data into an Array
//   - create new objects with the data that we're looking for

var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};


function generateClassRecordSummary(scores) {
  return {
    studentGrades: computeStudentGrades(scores),
    exams: computeExamData(scores),
  }
}

// to return studentGrades value

function computeStudentGrades(scores) {
  var studentGradesArray = [];
  var gradeString;

  Object.keys(scores).forEach(function (student) {
    studentGradesArray.push(numberAndLetterGradeString(student));
  });

  return studentGradesArray;
}

function numberAndLetterGradeString(studentData) {
  var numberGrade = String(calculateNumberGrade(studentData));
  var letterGrade = calculateLetterGrade(numberGrade);

  return numberGrade + ' (' + letterGrade + ')';
}

function calculateNumberGrade(studentData) {
  var examScores = studentScores[studentData]['scores']['exams'];
  var exerciseScores = studentScores[studentData]['scores']['exercises'];
  var averageExamScore = calculateExamScoreAverage(examScores);
  var exerciseScoreSum = calculateExerciseScoreSum(exerciseScores);

  return Math.round(averageExamScore * 0.65 + exerciseScoreSum * 0.35);
}

function calculateExamScoreAverage(examScores) {
  return examScores.reduce(function (sum, examScore) {
    return sum + examScore;
  }) / examScores.length;
}

function calculateExerciseScoreSum(exerciseScores) {
  return exerciseScores.reduce(function (sum, exerciseScore) {
    return sum + exerciseScore;
  });
}

function calculateLetterGrade(numberStringGrade) {
  if (numberStringGrade >= 93) {
    return 'A';
  } else if (numberStringGrade >= 85) {
    return 'B';
  } else if (numberStringGrade >= 77) {
    return 'C';
  } else if (numberStringGrade >= 69) {
    return 'D';
  } else if (numberStringGrade >= 60) {
    return 'E';
  } else if (numberStringGrade <= 59) {
    return 'F';
  }
}

// to return exams value

function computeExamData(scores) {
  var examDataArray = [];
  var dataByExam;

  dataByExam = formatExamDataByExam(scores);

  examDataArray = dataByExam.map(function (examScores) {
    return {
      average: calculateAverage(examScores),
      minimum: calculateMinimumScore(examScores),
      maximum: calculateMaximumScore(examScores),
    }
  });

  return examDataArray;
}

function formatExamDataByExam(scores) {
  var i;
  var examData;
  var examDataByStudent;
  var examDataByExam = [];

  examDataByStudent = extractExamDataByStudent(scores);

  for (i = 0; i < 4; i += 1) {
    examData = [];

    examDataByStudent.forEach(function (student) {
      examData.push(student[i]);
    });

    examDataByExam.push(examData);
  }

  return examDataByExam;
}

function extractExamDataByStudent(scores) {
  return Object.keys(scores).map(function (student) {
    return studentScores[student]['scores']['exams'];
  });
}

function calculateAverage(examScores) {
  var average;

  average = examScores.reduce(function (sum, score) {
    return sum + score;
  }) / (examScores.length);

  return Math.round(average * 10) / 10;
}

function calculateMinimumScore(examScores) {
  return examScores.reduce(function (minimum, score) {
    return minimum < score ? minimum : score;
  });
}

function calculateMaximumScore(examScores) {
  return examScores.reduce(function (maximum, score) {
    return maximum > score ? maximum : score;
  });
}

console.log(generateClassRecordSummary(studentScores));
