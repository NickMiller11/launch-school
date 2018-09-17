var invoices = {
  unpaid: [],
}

invoices.add = function(name, amount) {
  this.unpaid.push({
    name: name,
    amount: amount
  });
};

invoices.totalDue = function() {
  var sum = 0;

  this.unpaid.forEach(function (invoice) {
    sum += invoice.amount;
  });

  return sum;
};

invoices.paid = [];

invoices.payInvoice = function(clientName) {
  var i;
  var newUnpaid = [];

  for (i = 0; i < this.unpaid.length; i += 1) {
    if (clientName === this.unpaid[i].name) {
      this.paid.push(this.unpaid[i]);
    } else {
      newUnpaid.push(this.unpaid[i]);
    }
  }

  this.unpaid = newUnpaid;
}

invoices.totalPaid = function() {
  var sum = 0;

  this.paid.forEach(function (invoice) {
    sum += invoice.amount;
  });

  return sum;
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);

console.log(invoices.totalDue());

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
console.log(invoices.totalDue());
console.log(invoices.totalPaid());
