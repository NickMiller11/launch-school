function join(arr, str) {
  var i;
  var newString = '';

  for (i = 0; i < arr.length; i += 1) {
    newString += String(arr[i]);

    if (i === arr.length - 1) {
      break;
    }

    newString += str;
  }

  return newString;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'
