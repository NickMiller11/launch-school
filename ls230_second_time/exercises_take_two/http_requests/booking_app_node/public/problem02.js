var App = {
  requestSchedules: function() {
    var request = new XMLHttpRequest();

    request.open('GET', 'http://localhost:3000/api/schedules');
    request.send();

    request.addEventListener('load', function(e) {
      console.log(request.reponse, request.status)

    });
  },


  init: function() {
    this.requestSchedules();
  },
}

$(function() {
  App.init();
});
