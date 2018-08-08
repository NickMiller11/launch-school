var today = new Date();

var date = String(today.getDate());


function suffix(date) {
  if (date === 11 || date === 12 || date === 13) {
    return 'th';
  } else if (date % 10 === 1) {
    return 'st';
  } else if (date % 10 === 2) {
    return 'nd';
  } else if (date % 10 === 3) {
    return 'rd';
  } else {
    return 'th';
  }
}

function formattedDate(date) {
  var day = formattedDay(date);
  var month = formattedMonth(date);

  console.log("Today's date is " + day + ', ' + month + suffix(date.getDate()));
}

function formattedMonth() {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return months[today.getMonth()] + ' ' + today.getDate()
}

function formattedDay() {
  var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return String(daysOfWeek[today.getDay()]);
}

formattedDate(today);