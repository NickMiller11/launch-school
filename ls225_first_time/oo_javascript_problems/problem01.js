// The code below is expected to output the following when run:

// > var helloVictor = createGreeter('Victor');
// > helloVictor.greet('morning');
// = "Good Morning Victor"

function createGreeter(name) {
  return {
    name: name,
    morning: 'Good Morning',
    afternoon: 'Good Afternoon',
    evening: 'Good Evening',
    greet: function(timeOfDay) {
      var msg = ''
      switch (timeOfDay) {
        case 'morning':
          msg += this.morning + ' ' + name;
          break;
        case 'afternoon':
          msg += this.afternoon + ' ' + name;
          break;
        case 'evening':
          msg += this.evening + ' ' + name;
          break;
      }

      console.log(msg);
    },
  };
}

var helloVictor = createGreeter('Victor');
helloVictor.greet('morning');

// However, it instead results in an error. What is the problem with the code?
// Why isn't it producing the expected results?

// We need to add this. before each property in the greet function to reference
// the property.