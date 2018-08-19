function dateSuffix(dayOfMonth) {
  if ((dayOfMonth === 11) || (dayOfMonth === 12) || (dayOfMonth === 13)) {
    return 'th';
  }

  if (dayOfMonth % 10 === 1) {
    return 'st';
  } else if (dayOfMonth % 10 === 2) {
    return 'nd';
  } else if (dayOfMonth % 10 === 3) {
    return 'rd';
  } else {
    return 'th';
  }
}



var today = new Date();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var weekday = daysOfWeek[today.getDay()];
var dayOfMonth = today.getDate();
var suffix = dateSuffix(dayOfMonth);

console.log('Today\'s date is ' + weekday + ', the ' + dayOfMonth + suffix);