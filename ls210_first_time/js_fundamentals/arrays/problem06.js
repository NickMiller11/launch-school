


function reverse(inputForReversal) {
  var reversed
  var i

  if (typeof inputForReversal === "string") {
    reversed = '';
    for (i = inputForReversal.length - 1; i >= 0; i--) {
      reversed += inputForReversal[i];
    }
  } else if (Array.isArray(inputForReversal)) {
    reversed = [];
    for (i = inputForReversal.length - 1; i >= 0; i--) {
      reversed.push(inputForReversal[i]);
    }
  }

  return reversed;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

var array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]