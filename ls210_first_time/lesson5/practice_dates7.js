var today = new Date();
var nextWeek = new Date(today.getTime())

console.log(today.getTime());

console.log(today.toDateString() === nextWeek.toDateString());

nextWeek.setDate(today.getDate() + 7);

console.log(today.toDateString() === nextWeek.toDateString());