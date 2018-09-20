/*

1
Create an object named account that represents a bank account.
It should contain a balance property that stores the account's current balance.

var account = {
  balance: 0,
}

2
Add a deposit method to the account object that takes a single argument,
the value of the deposit. Add the value of the depost to the account's balance,
and then return it.

> account.balance;
= 0
> account.deposit(42);
= 42
> account.balance;
= 42

var account = {
  balance: 0,

  deposit: function(amount) {
    this.balance += amount;
    return amount;
  },
}

3
Add a withdraw method to the account object that takes a single argument,
the amount to withdraw. It should subtract the amount from the account's
balance and return the amount subtracted.

> account.balance;
= 100
> account.withdraw(19);
= 19
> account.balance;
= 81

var account = {
  balance: 0,
  transactions: [],

  deposit: function(amount) {
    this.balance += amount;
    return amount;
  },

  withdraw: function(amount) {
    if (amount > this.balance) {
      amount = this.balance;
    }

    this.balance -= amount;
    return amount;
  }
}

4
Each account should have a record of every deposit and withdrawal applied to it.
To do this, add a property named transactions to account that contains an array
of transactions, each of which is an object with type and amount properties.

> account.deposit(23);
= 23
> account.transactions;
= [{...}]
> account.transactions[0];
= {type: "deposit", amount: 23}

var account = {
  balance: 0,
  transactions: [],

  deposit: function(amount) {
    this.balance += amount;
    this.transactions.push({type: "deposit", amount: amount});
    return amount;
  },

  withdraw: function(amount) {
    if (amount > this.balance) {
      amount = this.balance;
    }

    this.balance -= amount;
    this.transactions.push({type: "withdraw", amount: amount});
    return amount;
  }
}

console.log(account.balance);
console.log(account.deposit(23));
console.log(account.transactions);
console.log(account.transactions[0]);

5
We want to create more than one account. Move the account creation code to a
function named makeAccount that returns a new account object.

> var account = makeAccount();
> account.deposit(15);
= 15
> account.balance;
= 15
> var otherAccount = makeAccount();
> otherAccount.balance;
= 0


function makeAccount() {
  return {
    balance: 0,
    transactions: [],

    deposit: function(amount) {
      this.balance += amount;
      this.transactions.push({type: "deposit", amount: amount});
      return amount;
    },

    withdraw: function(amount) {
      if (amount > this.balance) {
        amount = this.balance;
      }

      this.balance -= amount;
      this.transactions.push({type: "withdraw", amount: amount});
      return amount;
    },
  };
}

var account = makeAccount();
console.log(account.deposit(15));
console.log(account.balance);
var otherAccount = makeAccount();
console.log(otherAccount.balance);

6
We also need an object to manage accounts: a bank. Create a function that
returns an object that represents a bank. The bank should have a property
named accounts that represents a list of accounts.

> var bank = makeBank();
> bank.accounts;
= []

function makeBank() {
  return {
    accounts: [],
  }
}

7
Add a new method named openAccount to the object returned by makeBank.
It should create a new account, add it to the bank's accounts collection,
and return the new account. Each new account should have a unique account
number, starting at 101; each account number should be one greater than the
previous account created.

> var bank = makeBank();
> var account = bank.openAccount();
> account.number;
= 101
> bank.accounts;
= [{...}]
> bank.accounts[0];
= {number: 101, balance: 0, transactions: Array[0]}
> var secondAccount = bank.openAccount();
> secondAccount.number;
= 102

function makeBank() {
  var id = 100
  return {
    accounts: [],
    openAccount: function() {
      var account;
      id += 1;
      account = makeAccount(id)

      this.accounts.push(account);
      return account;
    },
  };
}

function makeAccount(id) {

  return {
    balance: 0,
    transactions: [],
    number: id,

    deposit: function(amount) {
      this.balance += amount;
      this.transactions.push({type: "deposit", amount: amount});
      return amount;
    },

    withdraw: function(amount) {
      if (amount > this.balance) {
        amount = this.balance;
      }

      this.balance -= amount;
      this.transactions.push({type: "withdraw", amount: amount});
      return amount;
    },
  };
}


var bank = makeBank();
var account = bank.openAccount();
console.log(account.number); // 101
console.log(bank.accounts); // [{...}]
console.log(bank.accounts[0]); // {number: 101, balance: 0, transactions: Array[0]}
var secondAccount = bank.openAccount();
console.log(secondAccount.number); //102

8
Add a new method to the bank object that transfers money from one account to another.

> var bank = makeBank();
> var source = bank.openAccount();
> source.deposit(10);
= 10
> var destination = bank.openAccount();
> bank.transfer(source, destination, 7);
= 7
> source.balance;
= 3
> destination.balance;
= 7

function makeBank() {
  var id = 100
  return {
    accounts: [],

    openAccount: function() {
      var account;
      id += 1;
      account = makeAccount(id)

      this.accounts.push(account);
      return account;
    },

    transfer: function(source, destination, amount) {
      source.withdraw(amount);
      destination.deposit(amount);
      return amount;
    }
  };
}

function makeAccount(id) {

  return {
    balance: 0,
    transactions: [],
    number: id,

    deposit: function(amount) {
      this.balance += amount;
      this.transactions.push({type: "deposit", amount: amount});
      return amount;
    },

    withdraw: function(amount) {
      if (amount > this.balance) {
        amount = this.balance;
      }

      this.balance -= amount;
      this.transactions.push({type: "withdraw", amount: amount});
      return amount;
    },
  };
}


var bank = makeBank();
var source = bank.openAccount();
console.log(source.deposit(10)); // 10
var destination = bank.openAccount();
console.log(bank.transfer(source, destination, 7)); // 7
console.log(source.balance); // 3
console.log(destination.balance); // 7



9
Change the code so that users can access the account balance, account number,
and transactions list by calling methods, but not by directly accessing those
properties.

> var bank = makeBank();
> var account = bank.openAccount();
> account.balance();
= 0
> account.deposit(17);
= 17
> var secondAccount = bank.openAccount();
> secondAccount.number();
= 102
> account.transactions();
> [Object]

*/
function makeBank() {
  var id = 100
  return {
    accounts: [],

    openAccount: function() {
      var account;
      id += 1;
      account = makeAccount(id)

      this.accounts.push(account);
      return account;
    },

    transfer: function(source, destination, amount) {
      source.withdraw(amount);
      destination.deposit(amount);
      return amount;
    }
  };
}

function makeAccount(id) {

  return {
    balance: 0,
    transactions: [],
    number: id,

    deposit: function(amount) {
      this.balance += amount;
      this.transactions.push({type: "deposit", amount: amount});
      return amount;
    },

    withdraw: function(amount) {
      if (amount > this.balance) {
        amount = this.balance;
      }

      this.balance -= amount;
      this.transactions.push({type: "withdraw", amount: amount});
      return amount;
    },
  };
}


var bank = makeBank();
var source = bank.openAccount();
console.log(source.deposit(10)); // 10
var destination = bank.openAccount();
console.log(bank.transfer(source, destination, 7)); // 7
console.log(source.balance); // 3
console.log(destination.balance); // 7
