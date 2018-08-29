function staggeredCase(string) {
  var stringArr = string.split('');
  var i;

  for (i = 0; i < stringArr.length; i += 1) {
    if (i % 2 === 0) {
      stringArr[i] = stringArr[i].toUpperCase();
    } else {
      stringArr[i] = stringArr[i].toLowerCase();
    }
  }

  return stringArr.join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 NuMbErS"