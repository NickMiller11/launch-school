var scissors = {
  id: 0,
  name: 'Scissors',
  stock: 8,
  price: 10,
};

var drill = {
  id: 1,
  name: 'Cordless Drill',
  stock: 15,
  price: 45,
};

function setPrice(obj, newPrice) {
  if (newPrice < 0) {
    alert('Error: new price is invalid.')
  }

  obj.price = newPrice;
}

function describeProduct(tool) {
  tool.keys().forEach(function (trait))
}