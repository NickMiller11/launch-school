// In JavaScript, comparing two objects either with == or === checks for object identity.
// In other words, the comparison evaluates to true if it's the same object on either
// side of == or ===. This is a limitation, in a sense, because sometimes we need to
// check if two objects have the same key/value pairs. JavaScript doesn't give us a way
// to do that.

// Write a function objectsEqual that accepts two object arguments and returns true or
// false depending on whether the objects have the same key/value pairs.

function objectsEqual(obj1, obj2) {
  var i;
  var temp;
  var equal = true;

  if (Object.keys(obj1).length < Object.keys(obj2).length) {
    temp = obj2;
    obj2 = obj1;
    obj1 = temp;
  }

  for (i = 0; 1 < Object.keys(obj1).length; i += 1) {
    if (Object.keys(obj1)[i] !== Object.keys(obj2)[i]) {
      equal = false;
      break;
    }
  }

  return equal;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1})); // false