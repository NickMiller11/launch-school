// The objective of this practice problem is to build a function that parses a string of email data.
// The function takes an argument that contains the data, parses it, then produces two basic
// statistics about the email:

// - The number of email messages found in the string
// - The date range of the email messages

// The email messages string has the following characteristics:

// - The string contains multiple email messages separated by the delimiter string ##||##.

// - Each email message has five parts. The delimiter string #/# separates the parts.

// - The five parts are:

// -- Sender
// -- Subject
// -- Date
// -- Recipient
// -- Body

// All five parts occur in the sequence shown above.

// input - string
// output - string

// rules:
// - return the number of emails
// - return the range of dates that the emails fell on, from earliest to latest

// algorithm:
// Return number of emails:
// - split data by the delimiter string
// - assign the count of that array to a variable
// - console log the variable

// Return date range:
// - filter the dates from the overall array
// - parse the month, day, year
// - use the month, day, year values to create new date objects
// - sort the date objects and assign the first and last ones to variables
// - console log the variables


function mailCount(emailData) {
  var emailCount;
  var emailDataArray;
  var dateArray;

  emailDataArray = emailData.split('##||##');

  emailCount = emailDataArray.length;
  dateArray = extractDateObjects(emailData);


  console.log('Count of Email: ' + String(emailCount));
  // console.log('Date Range ' + dateArray[0] + ' - ' + dateArray[dateArray.length - 1]);
}

function extractDateObjects(emailData) {
  var dateRegex = /\d{2}-\d{2}-\d{4}/g;
  var dateStringArray = emailArray.filter(function (email) {
    return email.match(dateRegex);
  });

  console.log(dateStringArray);
}


mailCount(emailData);

// console output

// Count of Email: 5
// Date Range: Sat Jun 25 2016 - Thu Aug 11 2016