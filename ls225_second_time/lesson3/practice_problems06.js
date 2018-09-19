/*

1
What does this point to in the code below, and what does the method return?

var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

myObject.myChildObject.myMethod();

--> it returns undefined since the execution context is myChildObject and there is
no count property on that object.

2
In the previous problem, how would you change the context, or the value of this,
to be the parent myObject?

var myObject = {
  count: 1,

  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

console.log(myObject.myChildObject.myMethod.call(myObject));

3
What does the following code log to the console?

var person = {
  firstName: 'Peter',
  lastName: 'Parker',
  fullName: function() {
    console.log(this.firstName + ' ' + this.lastName +
                ' is the Amazing Spiderman!');
  },
};

var whoIsSpiderman = person.fullName.bind(person);
whoIsSpiderman();

--> this logs "Peter Parker is the Amzing Spiderman!"

4
What does the following code log to the console?

var a = 1;
var obj = {
  a: 2,
  func: function() {
    console.log(this.a);
  },
};

obj.func(); // 2
obj.func.call(); // 1
obj.func.call(this); // 1
obj.func(obj); // 2

var obj2 = { a: 3 };
obj.func.call(obj2); // 3

--> see the above for log values

5
What does the following code log to the console?

var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
If you want this program to log 34000, how would you fix it?

--> this program logs 35000 to the console.  If you wanted it to log 34000, you would
need to change it to the below, adding a self variable that is set to the this in the first function:

var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    var self = this;
    function specialDiscount() {
      if (self.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
*/


