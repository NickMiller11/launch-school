// input - two arguments
// output - boolean

// rules
// - return true if exactly one argument is truthy, false otherwise

// algorithm
// - check to see if var1 and !var2, or !var1 and var2 are true
// - return true if so, false otherwise

function isXor(var1, var2) {
  return !!((var1 && !var2) || (!var1 && var2))

}

console.log(isXor(false, true));     // true
console.log(isXor(true, false));     // true
console.log(isXor(false, false));    // false
console.log(isXor(true, true));      // false


console.log(isXor(false, 3));        // true
console.log(isXor('a', undefined));  // true
console.log(isXor(null, ''));        // false
console.log(isXor('2', 23));         // false