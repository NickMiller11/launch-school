// function func() {
//   return this;
// }

// var context = func();

// console.log(context);

// var o = {
//   func: function() {
//     return this;
//   },
// };

// var context = o.func();

// console.log(context);

var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage();

var foo = {
  message: 'Hello from the function scope!',
};

foo.deliverMessage = deliverMessage;

foo.deliverMessage();