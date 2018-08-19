var today = new Date();
var tomorrow = new Date(today.getTime());
var nextWeek = new Date(today.getTime());

tomorrow.setDate(today.getDate() + 1);

console.log(today.toDateString() === nextWeek.toDateString());

nextWeek.setDate(today.getDate() + 7);

console.log(today.toDateString() === nextWeek.toDateString());