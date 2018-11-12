document.addEventListener('DOMContentLoaded', function() {
  var request = new XMLHttpRequest();

  request.open('GET', 'https://api.github.com/repos/rails/rails');

  request.addEventListener('load', function(e) {
    var data = JSON.parse(request.response);
    console.log(request.status);
    console.log(data.open_issues);
  });

  request.addEventListener('error', function(e) {
    console.log('The request could not be completed!');
  })

  request.send();
});
