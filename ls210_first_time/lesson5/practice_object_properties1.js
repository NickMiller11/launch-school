function objectHasProperty(obj, str) {
  var keys = Object.keys(obj);
  return keys.indexOf(str) !== -1;
}

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

console.log(objectHasProperty(pets, 'dog'));       // true
console.log(objectHasProperty(pets, 'lizard'));    // false
console.log(objectHasProperty(pets, 'mice'));      // true

// Initial response:
// return Object.keys(obj).includes(str);