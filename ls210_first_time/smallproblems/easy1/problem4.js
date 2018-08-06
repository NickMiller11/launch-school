var bill
var percent
var tip
var total

bill = parseInt(prompt("What is the bill?"), 10);
percent = parseInt(prompt("What is the tip percentage?"), 10) / 100;
tip = bill * percent;
total = bill + tip;

console.log(`The tip is $${tip}`);
console.log(`The total is $${total}`);