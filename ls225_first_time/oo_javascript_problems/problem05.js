/*
Create a school object. The school object uses the student object from the previous exercise.
It has methods that use and update information about the student. Be sure to check out the
previous exercise for the other arguments that might be needed by the school object.
Implement the following methods for the school object:

addStudent: Adds a student by creating a new student and adding the student to a collection of students.
The method adds a constraint that the year can only be any of the following values: '1st', '2nd',
'3rd', '4th',or '5th'. Returns a student object if year is valid otherwise it logs "Invalid Year".

enrollStudent: Enrolls a student in a course.

addGrade: Adds the grade of a student for a course.

getReportCard: Logs the grades of a student for all courses. If the course has no grade,
it uses "In progress" as the grade.

courseReport: Logs the grades of all students for a given course name. Only student with grades
are part of the course report.

To test your code, use the three student objects listed below. Using the three student objects,
produces the following values from the getReportCard and courseReport methods respectively.
*/


function createStudent(name, year) {
  return {
    name: name,
    year: year,
    courses: [],
    info: function() {
      console.log(this.name + " is a " + this.year + " student");
    },

    listCourses: function() {
      return this.courses;
    },

    addCourse: function(course) {
      this.courses.push(course);
    },

    addNote: function(courseCode, note) {
      var course = this.courses.filter(function(course) {
        return course.code === courseCode;
      })[0];

      if (course) {
        if (course.note) {
          course.note += '; ' + note;
        } else {
          course.note = note;
        }
      }

    },

    viewNotes: function() {
      this.courses.forEach(function(course) {
        if (course.note) {
          console.log(course.name + ': ' + course.note);
        }
      });
    },

    updateNote: function(courseCode, note) {
      var course = this.courses.filter(function(course) {
        return course.code === courseCode;
      })[0];

      if (course) {
        course.note = note;
      }
    },
  };
}

var school;

school = {
  studentBody: [],
  addStudent: function(name, year) {
    var validYears = ['1st', '2nd', '3rd', '4th', '5th'];
    var student;

    if (validYears.includes(year)) {
      student = createStudent(name, year);
      this.studentBody.push(student);
      return student;
    } else {
      console.log('Invalid Year');
    }
  },

  enrollStudent: function(student, courseName, courseCode) {
    student.addCourse({name: courseName, code: courseCode });
  },


}

school.addStudent('Nick', '2nd');
console.log(school.studentBody);
school.enrollStudent('Nick', { name: 'Math', code: '101'});
console.log(school.studentBody);
