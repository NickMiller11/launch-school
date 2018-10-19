(function() {
  var _ = function(element) {
    u = {
      first: function() {
        return element[0];
      },
      last: function() {
        return element[element.length - 1];
      },
      without: function() {
        var new_arr = [];
        var args = Array.prototype.slice.call(arguments);

        element.forEach(function (el) {
          if (args.indexOf(el) === -1)
        })
      },
    };

    return u;
  };

  window._ = _;
})();
