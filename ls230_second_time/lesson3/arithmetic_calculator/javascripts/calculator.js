/*
get 1st html number and assign to var
get 2nd html number and assign to var
assign selected operator to var and use it in if conditional
jQuery event to handle form submission
  preventDefault

  if addition -> add two numbers
  if subtraction -> subtract 2 numbers
  if multiplication -> multiply 2 numbers
  if division -> divide 2 numbers

  change h1 text content to result

*/

$(function() {
  $('form').submit(function(e) {
    e.preventDefault();
    var numerator = parseInt($('#numerator').val(), 10);
    var denominator = parseInt($('#denominator').val(), 10);
    var operator = $('#operator').children().filter(':selected').val();
    var result;

    if (operator === '+') {
      result = numerator + denominator;
    } else if (operator === '-') {
      result = numerator - denominator;
    } else if (operator === '*') {
      result = numerator * denominator;
    } else if (operator === '/') {
      result = numerator / denominator;
    }

    $('h1').text(result);
  });
});
