function copyProperties(obj1, obj2) {
  var i;
  var count = 0;

  for (i in obj1) {
    obj2[i] = obj1[i];
    count += 1;
  }

  return count;
}

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};
console.log(copyProperties(hal, sal));
console.log(sal);