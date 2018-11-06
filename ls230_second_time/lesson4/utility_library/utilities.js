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

        element.forEach(function(el) {
          if (args.indexOf(el) === -1) {
            new_arr.push(el);
          }
        });

        return new_arr;
      },

      lastIndexOf: function(search) {
        var idx = -1;

        for (var i = element.length - 1; i >= 0; i -= 1) {
          if (element[i] === search) {
            idx = i;
            break;
          }
        }

        return idx;
      },

      sample: function(qty) {
        var sampled = [];
        var copy = element.slice();
        var get = function() {
          var idx = Math.floor(Math.random() * copy.length);
          var el = copy[idx];
          copy.splice(idx, 1);
          return el;
        };

        if (!qty) { return get(); }
        while(qty) {
          sampled.push(get());
          qty -= 1;
        }

        return sampled;
      },
    };

    return u;
  };

  window._ = _;

  _.range = function(begin, end) {
    var range = [];

    if (end === undefined) {
      end = begin;
      begin = 0;
    }

    for (var i = begin; i < end; i += 1) {
      range.push(i);
    }

    return range;
  }
})();
