function wordCount(str) {
  var arr = str.split(' ');
  var i;
  var obj = {};

  for (i = 0; i < arr.length; i++) {
    currentItem = arr[i]
    if (obj[currentItem]) {
      obj[currentItem] += 1;
    } else {
      obj[currentItem] = 1;
    }
  }

  return obj;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }