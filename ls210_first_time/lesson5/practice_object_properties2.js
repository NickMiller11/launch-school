function incrementProperty(obj, val) {
  if (obj[val]) {
    obj[val] += 1;
  } else {
    obj[val] = 1;
  }

  return obj[val]
}

var wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie'));   // 5
console.log(wins);                               // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));    // 1
console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }