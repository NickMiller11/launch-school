/*

1
Write a function that returns the object on a given object's prototype chain
where a property is defined. See the example code below:

Object.prototype --> foo --> bar --> baz --> qux


// my solution

function getDefiningObject(object, propKey) {
  var testingObj = object;

  while (Object.getPrototypeOf(testingObj) !== null) {
    if (testingObj.hasOwnProperty(propKey)) {
      return testingObj;
    }

    testingObj = Object.getPrototypeOf(testingObj);
  }

  return null;
}

// LS solution

function getDefiningObject(object, propKey) {
  while (object && !object.hasOwnProperty(propKey)) {
    object = Object.getPrototypeOf(object);
  }

  return object;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // true
console.log(getDefiningObject(qux, 'e'));             // null



2
Write a function to provide a shallow copy of an object. The object that you
copy should share the same prototype chain as the original object, and it should
have the same own properties that return the same values or objects when accessed.
Use the code below to verify your implementation:

- create an object from the prototype of the input object
- add the same properties as the input object

function shallowCopy(object) {
  var newObject = Object.create(Object.getPrototypeOf(object));


  var i;
  var objectKeys = Object.keys(object);

  for (i = 0; i < objectKeys.length; i += 1) {
    newObject[objectKeys[i]] = object[objectKeys[i]];
  }



  return newObject;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

var baz = shallowCopy(bar);
console.log(baz);
console.log(baz.a);       // 1
baz.say();                // "c is 3"
console.log(baz.hasOwnProperty('a'));  //false
console.log(baz.hasOwnProperty('b'));  //false

Write a function that extends an object (destination object) with contents
from multiple objects (source objects).
*/


function shallowCopy(object) {
  var newObject = Object.create(Object.getPrototypeOf(object));


  var i;
  var objectKeys = Object.keys(object);

  for (i = 0; i < objectKeys.length; i += 1) {
    newObject[objectKeys[i]] = object[objectKeys[i]];
  }



  return newObject;
}



function extend(destination) {
  var argumentsArray = Array.prototype.slice.call(arguments);
  argumentsArray = argumentsArray.slice(1);
  var i;

  argumentsArray.forEach(function(obj) {
    var objectKeys = Object.keys(obj);

    for (i = 0; i < objectKeys.length; i += 1) {
      destination[objectKeys[i]] = obj[objectKeys[i]];
    }
  });

  return destination;
}



var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

var joe = {
  name: 'Joe'
};

var funcs = {
  sayHello: function() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  },
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // 1
object.sayHello();                // "Hello, Joe"
