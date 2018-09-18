// var scissors = {
//   id: 0,
//   name: 'Scissors',
//   stock: 8,
//   price: 10,

//   setPrice: function(newPrice) {
//     if (newPrice < 0) {
//       alert('New price is invalid');
//     } else {
//       this.price = newPrice;
//     }
//   },

//   describe: function() {
//     console.log('Name: ' + this.name);
//     console.log('ID: ' + this.id);
//     console.log('Price: $' + this.price);
//     console.log('Stock: ' + this.stock);
//   },
// };

// var drill = {
//   id: 1,
//   name: 'Cordless Drill',
//   stock: 15,
//   price: 45,

//   setPrice: function(newPrice) {
//     if (newPrice < 0) {
//       alert('New price is invalid');
//     } else {
//       this.price = newPrice;
//     }
//   },

//   describe: function() {
//     console.log('Name: ' + this.name);
//     console.log('ID: ' + this.id);
//     console.log('Price: $' + this.price);
//     console.log('Stock: ' + this.stock);
//   },
// };

function makeTool(id, name, stock, price) {
  return {
    id: id,
    name: name,
    stock: stock,
    price: price,

    setPrice: function(newPrice) {
      if (newPrice < 0) {
        alert('New price is invalid');
      } else {
        this.price = newPrice;
      }
    },

    describe: function() {
      console.log('Name: ' + this.name);
      console.log('ID: ' + this.id);
      console.log('Price: $' + this.price);
      console.log('Stock: ' + this.stock);
    },
  }
}

var scissors = makeTool(0, 'Scissors', 8, 10);
var drill = makeTool(1, 'Cordless Drill', 15, 45);
var hammer = makeTool(2, 'Hammer', 4, 80);
var screwdriver = makeTool(3, 'Screwdriver', 5, 10);