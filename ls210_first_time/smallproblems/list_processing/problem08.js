

// function buyFruit(arr) {
//   var newArray = [];

//   arr.forEach(function (subarr) {
//     var i;
//     for (i = 0; i < subarr[1]; i += 1) {
//       newArray.push(subarr[0]);
//     }
//   });

//   return newArray;
// }

function buyFruit(fruitsList) {
  return fruitsList.map(function (fruit) {
    return repeat(fruit);
  }).reduce(function (groceryList, fruit) {
    return groceryList.concat(fruit);
  });
}

function repeat(fruit) {
  var result = [];
  var i;

  for (i = 0; i < fruit[1]; i += 1) {
    result.push(fruit[0]);
  }

  return result;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]