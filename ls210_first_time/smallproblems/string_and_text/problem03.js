function letterCaseCount(string) {
  var count = {
    'lowercase': 0,
    'uppercase': 0,
    'neither': 0,
  };

  string.split('').forEach(function (char) {
    if (/[a-z]/.test(char)) {
      count.lowercase += 1;
    } else if (/[A-Z]/.test(char)) {
      count.uppercase += 1;
    } else {
      count.neither += 1;
    }
  });

  return count;
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }