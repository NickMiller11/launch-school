// function objectHasProperty(obj, str) {
//   var i;

//   for (i in pets) {
//     if (i === str) {
//       return true;
//     }
//   }

//   return false;
// }

// The code solution actually has a much easier version of this

function objectHasProperty(obj, str) {
  var keys = Object.keys(obj);
  return keys.indexOf(str) !== -1;
}

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

console.log(objectHasProperty(pets, 'dog'));
console.log(objectHasProperty(pets, 'lizard'));
console.log(objectHasProperty(pets, 'mice'));