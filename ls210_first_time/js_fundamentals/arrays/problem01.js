var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);

// this logs [1, 2, 3] and [1, 2, 3] on line 5 and 8.  The pop method mutates
// the array, causing it to be mutated for both variables.  myArray is then
// reassigned to a different array, leaving myOtherArray pointing at the first
// array