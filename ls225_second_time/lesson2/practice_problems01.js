// var me = {
//   firstName: 'Nick',
//   lastName: 'Miller',
// };

var me = {};
me.firstName = 'Nick';
me.lastName = 'Miller';

function fullName(person) {
  console.log(person.firstName + ' ' + person.lastName);
}

var friend = {
  firstName: 'Erik',
  lastName: 'Griebling',
};

var mother = {
  firstName: 'Judy',
  lastName: 'Miller',
};

var father = {
  firstName: 'Tim',
  lastName: 'Miller',
};

// fullName(me);
// fullName(friend);
// fullName(mother);
// fullName(father);

var people = [];

people.push(me);
people.push(friend);
people.push(mother);
people.push(father);

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

function rollCall(collection) {
  collection.forEach(fullName);
}

rollCall(people);
