function copyProperties(source, destination) {
  var count = 0;
  var property;
  for (property in source) {
    destination[property] = source[property];
    count += 1;
  }

  return count;
}

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }

// Initial answer
// function copyProperties(obj1, obj2) {
//   var keys = Object.keys(obj1);
//   var values = Object.value
//   var i

//   for (i = 0; i < keys.length; i++) {
//     var currentKey = keys[i];
//     obj2[currentKey] = obj1[currentKey];
//   }

//   return Object.keys(obj1).length;
// }