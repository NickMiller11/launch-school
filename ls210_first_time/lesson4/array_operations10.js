function join(arr, str) {
  var newStr = ''
  var i
  var strVersion

  for (i = 0; i < arr.length; i++) {
    strVersion = String(arr[i]);
    newStr += strVersion;
    if (i < arr.length - 1) {
      newStr += str;
    }
  }

  return newStr;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'