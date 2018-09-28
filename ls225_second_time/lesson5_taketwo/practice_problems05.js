/*

Write a function that returns the object on a given object's prototype chain
where a property is defined. See the example code below:

function getDefiningObject(object, propKey) {
  // ...
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

--->
My solution:

function getDefiningObject(object, propKey) {
  var currentObject = object;

  while (currentObject) {
    if (currentObject.hasOwnProperty(propKey)) {
      return currentObject;
    }

    currentObject = Object.getPrototypeOf(currentObject);
  }

  return null;
}

LS solution:

function getDefiningObject(object, propKey) {
  while (object && !object.hasOwnProperty(propKey)) {
    object = Object.getPrototypeOf(object);
  }

  return object;
}


2
Write a function to provide a shallow copy of an object.
The object that you copy should share the same prototype chain
as the original object, and it should have the same own properties
that return the same values or objects when accessed. Use the code
below to verify your implementation:

function shallowCopy(object) {
  // ...
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
console.log(baz.a);       // 1
baz.say();                // "c is 3"
baz.hasOwnProperty('a');  //false
baz.hasOwnProperty('b');  //false

--->

function shallowCopy(object) {
  var newObject = Object.create(Object.getPrototypeOf(object));
  var objProps = Object.getOwnPropertyNames(object);
  var i;
  var currentProp;

  for (i = 0; i < objProps.length; i += 1) {
    currentProp = objProps[i];
    newObject[currentProp] = object[currentProp];
  }

  return newObject;
}


3
Write a function that extends an object (destination object) with contents
from multiple objects (source objects).

function extend(destination) {
  // ...
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


--->
function extend(destination) {
  var sources = Array.prototype.slice.call(arguments);
  var objProps;
  var i;

  sources = sources.slice(1);

  sources.forEach(function (object) {
    Object.getOwnPropertyNames(object).forEach(function (prop) {
      destination[prop] = object[prop];
    });
  });

  return destination;
}

*/
