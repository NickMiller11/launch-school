// var chile = {
//   name: 'The Republic of Chile',
//   continent: 'South America',
//   getDescription: function() {
//     return this.name + ' is located in ' + this.continent + '.';
//   },
// };

// var canada = {
//   name: 'Canada',
//   continent: 'North America',
//   getDescription: function() {
//     return this.name + ' is located in ' + this.continent + '.';
//   },
// };

// var southAfrica = {
//   name: 'The Republic of South Africa',
//   continent: 'Africa',
//   getDescription: function() {
//     return this.name + ' is located in ' + this.continent + '.';
//   },
// };

// There is duplication in the getDescription function, as well as the name and continent property keys.

function makeCountry(name, continent, visited) {
  if (visited === undefined) {
    visited = false;
  }

  return {
    name: name,
    continent: continent,
    visited: visited,

    getDescription: function() {
      return this.name + ' is located in ' + this.continent + '. I ' +
      (this.visited ? 'have' : "haven't") +
      ' visited ' + this.name + '.';
    },

    visitCountry: function() {
      this.visited = true;
    },
  };
}

var chile = makeCountry('The Republic of Chile', 'South America');
var canada = makeCountry('Canada', 'North America');
var southAfrica = makeCountry('The Republic of South Africa', 'Africa');

southAfrica.visitCountry();

console.log(chile.getDescription());
console.log(canada.getDescription());
console.log(southAfrica.getDescription());