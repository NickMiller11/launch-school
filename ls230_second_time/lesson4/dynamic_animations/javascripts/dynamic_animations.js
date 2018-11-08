$(function() {
  var $canvas = $('#canvas');

  function getFormObject($f) {
    var o = {};
    $f.serializeArray().forEach(function(obj) {
      o[obj.name] = obj.value;
    });

    return o;
  }

  function createElement(data) {
    $d = $('<div />', {
      'class': data.shape_type,
      data: data,
    });

    resetElement($d);

    return $d;
  }

  function animateElement() {
    var $e = $(this);
    var data = $e.data();

    resetElement($e);

    $e.animate({
      top: data.end_x,
      left: data.end_y,
    }, 1000);
  }

  function resetElement($e) {
    var data = $e.data();

    $e.css({
      top: +data.start_y,
      left: +data.start_x,
    });
  }

  function stopAnimation() {
    $canvas .find('div').stop();
  }

  $('form').on('submit', function(e) {
    e.preventDefault();
    var $f = $(this);
    var data = getFormObject($f);

    $canvas.append(createElement(data));
  });

  $('#animate').on('click', function(e) {
    e.preventDefault();

    $canvas.find('div').each(animateElement);
  });

  $('#stop').on('click', function(e) {
    e.preventDefault();

    stopAnimation();
  });
});

/*
- write event handler for form's submit event (use #serializeArray)


function retrieveData(serialArray, dataType) {
  return serialArray.filter(function(obj) {
    return obj.name === dataType;
  })[0]["value"];
}

var start_x = retrieveData(serialArray, 'start_x');
var start_y = retrieveData(serialArray, 'start_y');
var end_x = retrieveData(serialArray, 'end_x');
var end_y = retrieveData(serialArray, 'end_y');
var shape = retrieveData(serialArray, 'shape_type');

$('#canvas').append('<div id="shape"></div>');
$('#shape').attr('data-startx', start_x).attr('data-starty', start_y);
$('#shape').attr('data-endx', end_x).attr('data-endy', end_y);
$('#shape').addClass(shape);

$('shape').css({
  'top': +start_y,
  'left': +start_x,
*/
