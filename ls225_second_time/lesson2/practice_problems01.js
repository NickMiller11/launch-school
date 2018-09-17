// var me = {
//   firstName: 'Nick',
//   lastName: 'Miller',
// };

// var me = {};
// me.firstName = 'Nick';
// me.lastName = 'Miller';

// function fullName(person) {
//   console.log(person.firstName + ' ' + person.lastName);
// }

// var friend = {
//   firstName: 'Erik',
//   lastName: 'Griebling',
// };

// var mother = {
//   firstName: 'Judy',
//   lastName: 'Miller',
// };

// var father = {
//   firstName: 'Tim',
//   lastName: 'Miller',
// };

// fullName(me);
// fullName(friend);
// fullName(mother);
// fullName(father);

// var people = [];

// people.push(me);
// people.push(friend);
// people.push(mother);
// people.push(father);

// function rollCall(collection) {
//   var length = collection.length;
//   var i
//
//   for (i = 0; i < length; i += 1) {
//     fullName(collection[i]);
//   }
// }
//
// rollCall(people);

// function rollCall(collection) {
//   collection.forEach(fullName);
// }

// rollCall(people);

var people = {
  collection: [],
  uniqueIndex: 0,

  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  rollCall: function() {
    this.collection.forEach(this.fullName);
  },

  add: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    person.id = this.uniqueIndex;
    this.uniqueIndex += 1;

    this.collection.push(person);
  },

  getIndex: function(person) {
    var index = -1;
    this.collection.forEach(function(comparator, i) {
      if (comparator.id === person.id) {
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
    return typeof person.firstName !== 'string' && typeof person.lastName !== 'string';
  },

  get: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    return this.collection[this.getIndex(person)];
  },

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
  }
};

people.add({ firstName: 'Nick', lastName: 'Miller' });
people.add({ firstName: 'Erik', lastName: 'Griebling' });
people.add({ firstName: 'Judy', lastName: 'Miller' });
people.add({ firstName: 'Tim', lastName: 'Miller' });

people.rollCall();
console.log(people.collection);
people.update( { firstName: 'Nock', lastName: 'Mueller', id: 0 });
console.log(people.collection);
