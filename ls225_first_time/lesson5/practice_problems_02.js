/*
Write a function that returns the object on a given object's prototype chain
where a property is defined. See the example code below:

foo -- bar -- baz -- qux

check to see if property is property of current object with #hasOwnProperty
  if yes --> return object
  if no --> set object to #getPrototypeOf(object)
*/

function getDefiningObject(object, propKey) {
  var toggle = false;
  while (!toggle) {
    if (Object.getPrototypeOf(object) === null) {
      return null;
    } else if (!object.hasOwnProperty(propKey)) {
      object = Object.getPrototypeOf(object);
    } else {
      toggle = true;
    }
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
