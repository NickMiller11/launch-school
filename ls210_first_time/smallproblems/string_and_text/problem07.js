function staggeredCase(string) {
  var stringArr = string.split('');
  var i;
  var j = 0;

  for (i = 0; i < stringArr.length; i += 1) {
    if (j % 2 === 0 && /[a-z]/i.test(stringArr[i])) {
      stringArr[i] = stringArr[i].toUpperCase();
      j += 1;
    } else if (j % 2 !== 0 && /[a-z]/i.test(stringArr[i])) {
      stringArr[i] = stringArr[i].toLowerCase();
      j += 1;
    }
  }

  return stringArr.join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 NuMbErS"