function mailCount(emailData) {
  var firstDate;
  var lastDate;
  var emailArray;
  var emailCount;
  var individualEmail;
  var year;
  var month;
  var day;
  var dates = [];

  emailData = emailData.replace(/[\n\t\v\r\f]/g, '');

  emailArray = emailData.split('##||##');
  emailCount = emailArray.length;

  emailArray = emailArray.map(function (email) {
    individualEmail = email.split('#/#');
    return {
      'from': individualEmail[0],
      'subject': individualEmail[1],
      'date': individualEmail[2],
      'to': individualEmail[3],
      'body': individualEmail[4],
    }
  });

  emailArray.forEach(function (email) {
    dates.push(createDateObj(email.date));
  });

  dates = dates.sort(function (a,b) {
    return a - b;
  });

  firstDate = formatDate(dates[0]);
  lastDate = formatDate(dates[dates.length - 1]);

  console.log('Count of Email: ' + emailCount);
  console.log('Date Range: ' + firstDate + ' - ' + lastDate)
}

function createDateObj(dateData) {
  "Date: 07-27-2016"
  var year = dateData.slice(12);
  var month = String(parseInt(dateData.slice(6, 8), 10) - 1);
  var day = dateData.slice(9, 11);

  return new Date(year, month, day);
}

function formatDate(date) {
  return String(date).slice(0, 15);
}

mailCount(emailData);



// console output

// Count of Email: 5
// Date Range: Sat Jun 25 2016 - Thu Aug 11 2016