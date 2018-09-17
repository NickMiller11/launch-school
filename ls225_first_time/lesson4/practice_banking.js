function makeAccount(number) {
  var balance = 0;
  var transactions = [];

  return {
    deposit: function(amount) {
      this.balance += amount;
      this.transactions.push({type: 'deposit', amount: amount});
      console.log(amount);
    },

    withdraw: function(amount) {
      if (amount > this.balance) {
        amount = this.balance
      }

      this.balance -= amount;
      this.transactions.push({type: 'withdraw', amount: amount});
      console.log(amount);
    },

    balance: function() {
      return balance;
    },

    transactions: function() {
      return transactions;
    },

    number: function() {
      return number;
    },
  }
}



function makeBank() {
  var accounts = [];

  return {
    openAccount: function() {
      var number = accounts.length + 101;
      var account = makeAccount(number);
      accounts.push(account);
      return account;
    },

    transfer: function(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    }
  }
}

var bank = makeBank();
var account = bank.openAccount();
console.log(account.number);
console.log(bank.accounts);
console.log(bank.accounts[0]);
var secondAccount = bank.openAccount();
console.log(secondAccount.number);
