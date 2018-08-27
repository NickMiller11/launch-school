function transactionsFor(idNum, transactionsList) {
  return transactionsList.filter(function (obj) {
    return obj.id === idNum;
  });

}

function isItemAvailable(idNum, transactionList) {
  var listOfIdTransactions = transactionsFor(idNum, transactionList);

  var sum = listOfIdTransactions.reduce(function (total, obj) {
    if (obj.movement === 'in') {
      return total + obj.quantity;
    } else if (obj.movement === 'out') {
      return total - obj.quantity;
    }
  }, 0);

  return sum > 0;
}


var transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true