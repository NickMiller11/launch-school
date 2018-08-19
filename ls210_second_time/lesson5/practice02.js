// function incrementProperty(obj, str) {
//   var keys = Object.keys(obj);

//   if (keys.indexOf(str) === -1) {
//     obj[str] = 1;
//   } else {
//     obj[str] += 1;
//   }

//   return obj[str];
// }

// after checking the code solution, they come up with a simplier answer

function incrementProperty(obj, str) {
  if (obj[str]) {
    obj[str] += 1;
  } else {
    obj[str] = 1;
  }

  return obj[str];
}

var wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie'));
console.log(wins);
console.log(incrementProperty(wins, 'lucy'));
console.log(wins);