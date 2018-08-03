function trimLeft(str) {
  var i
  var length = str.length;

  for (i = 0; i < length; i++) {
    if (str[i] !== ' ') {
      break;
    }
  }

  return i;
}

function trimRight(str) {
  var i
  var length = str.length;

  for (i = length - 1; i >= 0; i--) {
    if (str[i] !== ' ') {
      break;
    }
  }

  return i;
}

function trim(str) {
  var start_i
  var end_i
  var final_str

  start_i = trimLeft(str);
  end_i = trimRight(str);

  if (end_i === -1) {
    return '';
  }

  for (final_str = ''; start_i <= end_i; start_i++) {
    final_str += str[start_i];
  }

  return final_str;
}



console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""