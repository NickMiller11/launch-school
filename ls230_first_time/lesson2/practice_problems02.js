var counterId;

function startCounting() {
  var i = 0;

  counterId = setInterval(function() {
    i += 1;
    console.log(i);
  }, 1000);

}

startCounting();

function stopCounting() {
  clearInterval(counterId);
}
