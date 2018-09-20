/*

1
Reimplement makeList, so that it returns an Object that provides the
interface shown above, including add, list, and remove methods.



function makeList() {
  return {
    list: [],

    add: function(item) {
      if (this.list.indexOf(item) === -1) {
        this.list.push(item);
        console.log(item + ' added!');
      }
    },

    list: function() {
      if (this.list.length > 0) {
        this.list.forEach(function (item) {
          console.log(item);
        });
      } else {
        console.log('The list is empty.');
      }
    },

    remove: function(item) {
      var i = this.list.indexOf(item);

      if (i !== -1) {
        this.list.splice(i, 1);
        console.log(item + ' removed!');
      }
    },
  };
}

2
Notice that the solution lets us access the array of items through the items property:

> list.items;            // items accessible from outside object
= ['corn']               // since it is an object property

This was not the case in the single-function implementation:

> list.items;            // items not accessible from outside function
= undefined              // since it is within a closure

Update the implementation from problem 1 so that it retains the use of an object
with methods but prevents outside access to the items the object stores internally.

*/

function makeList() {
  var list = [];

  return {
    add: function(item) {
      if (list.indexOf(item) === -1) {
        list.push(item);
        console.log(item + ' added!');
      }
    },

    list: function() {
      if (list.length > 0) {
        list.forEach(function (item) {
          console.log(item);
        });
      } else {
        console.log('The list is empty.');
      }
    },

    remove: function(item) {
      var i = list.indexOf(item);

      if (i !== -1) {
        list.splice(i, 1);
        console.log(item + ' removed!');
      }
    },
  };
}
