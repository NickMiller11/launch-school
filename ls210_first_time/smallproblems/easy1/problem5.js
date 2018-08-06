var int
var operation

int = parseInt(prompt('Please enter an integer greater than 0:'), 10);
operation = prompt('Enter "s" to computer the sum, or "p" to compute the product.');

var i
var total = 1;


if (operation === 's') {
  for (i = 2; i <= int; i++) {
    total += i;
  }

  console.log(`The sum of the integers between 1 and ${int} is ${total}.`);

} else if (operation === 'p') {
  for (i = 1; i <= int; i++) {
    total *= i;
  }

  console.log(`The product of the integers between 1 and ${int} is ${total}.`);
}

