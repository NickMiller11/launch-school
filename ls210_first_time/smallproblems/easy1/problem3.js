var length
var width
var area_meters
var area_feet

length = prompt('Enter the length of the room in meters:');
width = prompt('Enter the width of the room in meters:');
area_meters = Math.round((length * width) * 100) / 100;
area_feet = Math.round((area_meters * 10.7639) * 100) / 100;
console.log(`The area of the room is ${area_meters} square meters (${area_feet} square feet).`)