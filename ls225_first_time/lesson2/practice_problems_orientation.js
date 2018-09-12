function createProduct(id, name, stock, price) {
  return {
    id: id,
    name: name,
    stock: stock,
    price: price,
    setPrice: function(newPrice) {
      if (newPrice < 0) {
        alert('Error: new price is invalid.')
      }

      this.price = newPrice;
    },

    describe: function() {
      console.log('Name: ' + this.name);
      console.log('ID: ' + this.id);
      console.log('Price: $' + this.price);
      console.log('Stock: ' + this.stock);
    },
  }
}

var scissors = createProduct(0, 'Scissors', 8, 10);
var drill = createProduct(1, 'Cordless Drill', 15, 45);

// }

// var scissors = {
//   id: 0,
//   name: 'Scissors',
//   stock: 8,
//   price: 10,
//   setPrice: function(newPrice) {
//     if (newPrice < 0) {
//       alert('Error: new price is invalid.')
//     }

//     this.price = newPrice;
//   },

//   describe: function() {
//     console.log('Name: ' + this.name);
//     console.log('ID: ' + this.id);
//     console.log('Price: $' + this.price);
//     console.log('Stock: ' + this.stock);
//   }
// };

// var drill = {
//   id: 1,
//   name: 'Cordless Drill',
//   stock: 15,
//   price: 45,
//   setPrice: function(newPrice) {
//     if (newPrice < 0) {
//       alert('Error: new price is invalid.')
//     }

//     this.price = newPrice;
//   },

//   describe: function() {
//     console.log('Name: ' + this.name);
//     console.log('ID: ' + this.id);
//     console.log('Price: $' + this.price);
//     console.log('Stock: ' + this.stock);
//   }
// };

// function setPrice(obj, newPrice) {
//   if (newPrice < 0) {
//     alert('Error: new price is invalid.')
//   }

//   obj.price = newPrice;
// }

// function describeProduct(tool) {
//   console.log('Name: ' + tool.name);
//   console.log('ID: ' + tool.id);
//   console.log('Price: $' + tool.price);
//   console.log('Stock: ' + tool.stock);
// }