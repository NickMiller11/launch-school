
var me = {};
me.firstName = 'Nick';
me.lastName = 'Miller';

// function fullName(person) {
//   console.log(person.firstName + ' ' + person.lastName);
// }

// fullName(me);

var friend = {
  firstName: 'Erik',
  lastName: 'Griebling',
};

// fullName(friend);

var mother = {
  firstName: 'Judy',
  lastName: 'Miller',
};

var father = {
  firstName: 'Tim',
  lastName: 'Miller',
};

// fullName(mother);
// fullName(father);

// var people = [];

// people.push(me);
// people.push(friend);
// people.push(mother);
// people.push(father);

// function rollCall(collection) {
//   var length;
//   var i;
//   for (i = 0, length = collection.length; i < length; i += 1) {
//     fullName(collection[i]);
//   }
// }

// function rollCall(collection) {
//   collection.forEach(function(item) {
//     fullName(item);
//   });
// }

// function rollCall(collection) {
//   collection.forEach(fullName);
// }

// rollCall(people);

var people = {
  collection: [me, friend, mother, father],
  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  rollCall: function() {
    this.collection.forEach(people.fullName);
  },

  add: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    this.collection.push(person);
  },

  getIndex: function(person) {
    var index = -1;
    this.collection.forEach(function(comparator, i) {
      if (comparator.firstName === person.firstName &&
          comparator.lastName === person.lastName) {
        index = i;
      }
    });

    return index;
  },

  remove: function(person) {
    var index;
    if (this.isInvalidPerson(person)) {
      return;
    }

    index = this.getIndex(person);
    if (index === -1) {
      return;
    }

    this.collection.splice(index, 1);
  },

  isInvalidPerson: function(person) {
    return typeof person.firstName === 'string' && typeof person.lastName === 'string';
  },

  get: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    return this.collection[this.getIndex(person)];
  }

  update: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    var existingPersonId = this.getIndex(person);
    if (existingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonId] = person;
    }
  };
}

console.log(people.getIndex(friend));
people.remove(friend);
console.log(people.getIndex(friend));
