var today = new Date();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var weekday = daysOfWeek[today.getDay()];
var dayOfMonth = today.getDate();

console.log('Today\'s date is ' + weekday + ', the ' + dayOfMonth);