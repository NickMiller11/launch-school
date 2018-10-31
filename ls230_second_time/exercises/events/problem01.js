// Write a function, randomizer that accepts n number of callbacks that will
// be executed at a random point in time. In addition to executing the callbacks,
// randomizer should also log the elapsed time in seconds. To limit the randomness
// of the points in time that callbacks will be executed, you may assume that all
// callbacks should be executed within 2 * number of callbacks seconds.

function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(callbacks) {
  var totalCallbacks = Array.prototype.slice.call(arguments);
  var maxTime = totalCallbacks.length * 2;
  var secondsElapsed = 0;
  var timeLogger = setInterval(function() {
    secondsElapsed += 1;
    console.log(secondsElapsed);

    if (secondsElapsed > maxTime) {
      clearInterval(timeLogger);
    }
  }, 1000);


  totalCallbacks.forEach(function (callback) {
    var time = Math.floor(Math.random() * Math.floor(maxTime)) + 1;
    setTimeout(callback, time * 1000);
  });
}
randomizer(callback1, callback2, callback3);
// Output:
// 1
// 2
// "callback2"
// "callback3"
// 3
// 4
// 5
// "callback1"
// 6
