// Write a function that takes a string as an argument and returns
// true if the string contains properly balanced parentheses, false otherwise.
// Parentheses are properly balanced only when '(' and ')' occur in matching pairs,
// with each pair starting with '('.

// input - string
// output - boolean

// rules:
// - as soon as the paraentheses in the input string become inbalanced, returned false
// - imbalanced parentheses means that there is not a left open parenthesis followed by
//   a right closing parenthesis
// - if the input string does not become imbalanced, return true

// algorithm:
// - create a counter for the parenthesis
// - split the string into an array and iterate through it
// - if there is a left parenthesis, add 1 to the counter
// - if there is a right parenthesis, subtract 1 from the counter
// - break if the counter is negative
// - return comparing the counter to greater than or equal to 0

function isBalanced(string) {
  var counter = 0;
  var i;

  for (i = 0; i < string.length; i += 1) {
    if (string[i] === '(') {
      counter += 1;
    } else if (string[i] === ')') {
      counter -= 1;
    }

    if (counter < 0) {
      break;
    }
  }

  return counter === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false