var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);

// Alternative 1

myArray = [1, 2, 3, 4];
myOtherArray = [];
var i

for (i = 0, i < myArray.length; i++) {
  myOtherArray.push(myArray[i]);
}

// Alternative 2

myArray = [1, 2, 3, 4];
myOtherArray = myArray.slice()