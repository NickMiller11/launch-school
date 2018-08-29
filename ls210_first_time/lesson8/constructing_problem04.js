function isBalanced(string) {
  var parenthesisTotal = 0;
  var i;

  for (i = 0; i < string.length; i += 1) {
    if (string[i] === '(') {
      parenthesisTotal += 1;
    } else if (string[i] === ')') {
      parenthesisTotal -= 1;
    }

    if (parenthesisTotal < 0) {
      return false
    }
  }

  return parenthesisTotal === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false