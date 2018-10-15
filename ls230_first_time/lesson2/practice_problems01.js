// function logger(text) {
//   return function() {
//     console.log(text);
//   }
// }
//
// function delayLog() {
//   var i;
//
//   for (i = 1; i <= 10; i += 1) {
//     setTimeout(logger(i), i * 1000);
//   }
// }
//
// delayLog();

// setTimeout(function() { // 1
//   console.log('Once'); // 5
// }, 1000);
//
// setTimeout(function() { // 2
//   console.log('upon'); // 7
// }, 3000);
//
// setTimeout(function() { // 3
//   console.log('a'); // 6
// }, 2000);
//
// setTimeout(function() { // 4
//   console.log('time'); // 8
// }, 4000);

// setTimeout(function() {
//   setTimeout(function() {
//     q(); // 7
//   }, 15);
//
//   d(); // 3
//
//   setTimeout(function() {
//     n(); // 5
//   }, 5);
//
//   z(); // 4
// }, 10);
//
// setTimeout(function() {
//   s(); // 6
// }, 20);
//
// setTimeout(function() {
//   f(); // 2
// });
//
// g(); // 1

function afterNseconds(callback, seconds) {
  setTimeout(callback, seconds * 1000);
}
