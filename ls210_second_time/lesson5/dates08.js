
function formattedDate(date) {
  var day = formattedDay(date);
  var month = formattedMonth(date);

  console.log("Today's date is " + day + ', ' + month + ' ' + suffix)
}

function formattedMonth(date) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[date.getMonth()]
}

function formattedDay(date) {
  var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return daysOfWeek[date.getDay()];
}

function dateSuffix(date) {
  var suffix;

  if ((date === 11) || (date === 12) || (date === 13)) {
    suffix = 'th';
  }

  if (date % 10 === 1) {
    suffix = 'st';
  } else if (date % 10 === 2) {
    suffix = 'nd';
  } else if (date % 10 === 3) {
    suffix = 'rd';
  } else {
    suffix = 'th';
  }

  return date + suffix;
}


var today = new Date();
var date = today.getDate();
var suffix = dateSuffix(date);

formattedDate(today)