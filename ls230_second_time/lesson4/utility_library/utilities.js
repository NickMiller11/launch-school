(function() {
  var findObjs = function(element, props, multiple) {
    var match = multiple ? [] : undefined;

    element.some(function(obj) {
      var allMatch = true;
      for (var prop in props) {
        if (!(prop in obj) || obj[prop] !== props[prop]) {
          allMatch = false;
        }
      }

      if (allMatch) {
        if (multiple) {
          match.push(obj);
        } else {
          match = obj;
          return true;
        }
      }
    });

    return match;
  }

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

      findWhere: function(props) {
        return findObjs(element, props, false);
      },

      where: function(props) {
        return findObjs(element, props, true);
      },

      pluck: function(query) {
        var vals = [];

        element.forEach(function (obj) {
          if (obj[query]) {
            vals.push(obj[query]);
          }
        });

        return vals;
      },

      keys: function() {
        var vals = [];

        for (var key in element) {
          vals.push(key);
        }

        return vals;
      },

      values: function() {
        var vals = [];

        for (var key in element) {
          vals.push(element[key]);
        }

        return vals;
      },

      pick: function() {
        var props = Array.prototype.slice.call(arguments);
        var newObj = {};

        props.forEach(function(prop) {
          if (prop in element) {
            newObj[prop] = element[prop];
          }
        });

        return newObj;
      },

      omit: function() {
        var props = Array.prototype.slice.call(arguments);
        var newObj = {};

        for (prop in element) {
          if (props.indexOf(prop) === -1) {
            newObj[prop] = element[prop];
          }
        }

        return newObj;
      },

      has: function(prop) {
        var keys = Object.keys(element);
        return keys.indexOf(prop) !== -1;
      },
    };

    (['isElement', 'isArray', 'isObject', 'isFunction', 'isBoolean', 'isString', 'isNumber']).forEach(function(method) {
      u[method] = function() { _[method].call(u, element); };
    });

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
  };

  _.extend = function() {
    var args = [].slice.call(arguments);
    var oldObj = args.pop();
    var newObj = args[args.length - 1];

    for (var prop in oldObj) {
      newObj[prop] = oldObj[prop];
    }

    return args.length === 1 ? newObj : _.extend.apply(_, args);
  };

  _.isElement = function(obj) {
    return obj && obj.nodeType === 1;
  };

  _.isArray = Array.isArray || function(obj) {
    return toString.call(obj) === '[object Array]';
  };

  _.isObject = function(obj) {
    var type = typeof obj;

    return type === 'function' || type === 'object' && !!obj;
  };

  _.isFunction = function(obj) {
    var type = typeof obj;

    return type === 'function';
  };

  (['Boolean', 'String', 'Number']).forEach(function(method) {
    _['is' + method] = function(obj) {
      return toString.call(obj) === '[object ' + method + ']';
    };
  });

})();
