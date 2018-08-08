var today = new Date();

function formatTime(date) {
  var hours = String(date.getHours());
  var minutes = String(date.getMinutes());

  if (hours.length === 1) {
    hours = "0" + hours;
  }

  return hours + ":" + minutes;
}

console.log(formatTime(today));