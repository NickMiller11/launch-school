function makeCountry(name, continent, visited) {
  if (visited === undefined) {
    visited = false;
  }

  return {
    name: name,
    continent: continent,
    getDescription: function() {
      var visitStatus;
      if (this.visited) {
        visitStatus = 'I have visited ' + this.name + '.';
      } else {
        visitStatus = "I haven't visited " + this.name + '.';
      }

      return this.name + ' is located in ' + this.continent + '. ' + visitStatus;
    },
    visited: visited,
    visitCountry: function() {
      this.visited = true;
    },
  };
}

var chile = makeCountry('The Republic of Chile', 'South America');
var canada = makeCountry('Canada', 'North America');
var southAfrica = makeCountry('South Africa', 'Africa');

console.log(chile.getDescription());
console.log(canada.getDescription());
console.log(southAfrica.getDescription());

canada.visitCountry();
console.log(canada.getDescription());