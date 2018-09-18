/*
1
Our desired output for the code below is: Christopher Turk is a Surgeon.
What will the code output, and what explains the difference, if any,
between the actual and desired outputs?

var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

function logReturnVal(func) {
  var returnVal = func();
  console.log(returnVal);
}

logReturnVal(turk.getDescription);

--> this code will output 'undefined undefined is a undefined.'
This is because the 'this' binding doesn't carry over into the logReturnVal function

2
Alter logReturnVal such that it takes an additional context argument, and
use one of the methods we've learned in this lesson to invoke func inside
of logReturnVal with context as its function execution context. Alter the
invocation of logReturnVal and supply turk as the context argument.

*/

// var turk = {
//   firstName: 'Christopher',
//   lastName: 'Turk',
//   occupation: 'Surgeon',
//   getDescription: function() {
//     return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
//   }
// };

// function logReturnVal(func, context) {
//   var returnVal = func.call(context);
//   console.log(returnVal);
// }

// logReturnVal(turk.getDescription, turk);

/*
Suppose that we want to extract getDescription from turk,
but always have it execute with turk as context. Use one of the
methods we've learned in the last lesson to assign such a permanently
bound function to a new variable, getTurkDescription.


var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  },
};

function logReturnVal(func) {
  var returnVal = func();
  console.log(returnVal);
}

var getTurkDescription = turk.getDescription.bind(turk);
console.log(getTurkDescription());


5
Consider the code below, and our desired output:

var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();

Desired output:

The Elder Scrolls Arena
The Elder Scrolls Daggerfall
The Elder Scrolls Morrowind
The Elder Scrolls Oblivion
The Elder Scrolls Skyrim

Will this code log our desired output? Why or why not?

--> No, because forEach is executed with the global context.  You could assign this to self on the
line before the forEach method and call the seriesTitle with self instead of this.

5
Use the var self = this fix to alter TESgames.listGames such that it logs our desired output to the console.



var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    var self = this;
    this.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();

6
If we don't want to rely on var self = this, forEach provides us with an alternative
means of supplying execution context to the inner function. Use this means to achieve our desired output.

var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    }, this);
  }
};

TESgames.listGames();

7
Consider the code below:

var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }

    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();

What will the value of foo.a be after this code has executed?

--> 0 because the execution context of the increment function is global

8
Use one of the methods we learned in this lesson to invoke increment with explicit
context such that foo.a is incremented with each invocation of incrementA.
*/

var foo = {
  a: 0,
  incrementA: function() {
    var increment = function() {
      this.a += 1;
    }.bind(this);

    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();
console.log(foo.a);
