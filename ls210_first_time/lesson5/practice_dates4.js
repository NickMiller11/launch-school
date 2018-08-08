var today = new Date();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
console.log("Today's day is " + String(daysOfWeek[today.getDay()]) + ", the " + String(today.getDate()));