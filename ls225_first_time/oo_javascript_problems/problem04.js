// Create an object factory for a student object. The student object should have the
// following methods and it should produce the expected results demonstrated in the
// sample code:

// info: Logs the name and year of the student.

// addCourse: Enrolls student in a course. A course is an object literal that has properties
// for its name and code.

// listCourses: Returns a list of the courses student has enrolled in.

// addNote: Adds a note property to a course. Takes a code and a note as an argument.
// If a note already exists, the note is appended to the existing one.

// updateNote: Updates a note for a course. Updating a note replaces the existing note
// with the new note.

// viewNotes: Logs the notes for all the courses. Courses without notes are not displayed.

function createStudent(name, year) {
  return { name: name,
           year: year,
           courses: [],

           info: function() {
             console.log(this.name + ' is a ' + this.year + ' year student');
           },

           addCourse: function(course) {
             this.courses.push(course);
           },

           listCourses: function() {
             console.log(this.courses);
           },

           addNote: function(classCode, note) {
             var i;
             for (i = 0; i < this.courses.length; i += 1) {
               if (this.courses[i].code === classCode) {
                 this.courses[i].notes ? this.courses[i]['notes'].push(note) || this.courses[i].notes = [note];
               }
             }

           },

           viewNotes: function() {
             this.courses.forEach(function (course) {
               console.log(course.notes);
             });
           },
         }
}

var foo = createStudent('Foo', '1st');
foo.info();
foo.listCourses();
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
for.addNote(101, 'Fun course');
for.addNote(101, 'Remember to study for algebra');
for.viewNotes();


// > foo = createStudent('Foo', '1st');
// > foo.info();
// = 'Foo is a 1st year student'
// > foo.listCourses();
// = [];
// > foo.addCourse({ name: 'Math', code: 101 });
// > foo.addCourse({ name: 'Advanced Math', code: 102 });
// > foo.listCourses();
// = [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
// > foo.addNote(101, 'Fun course');
// > foo.addNote(101, 'Remember to study for algebra');
// > foo.viewNotes();
// = "Math: Fun Course; Remember to study for algebra"
// > foo.addNote(102, 'Difficult subject');
// > foo.viewNotes();
// = "Math: Fun Course; Remember to study for algebra"
// = "Advance Math: Difficult Subject"
// > foo.updateNote(101, 'Fun course');
// > foo.viewNotes();
// = "Math: Fun Course"
// = "Advance Math: Difficult Subject"