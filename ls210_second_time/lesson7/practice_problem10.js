var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

// There are problems with this data, though,
// so we first have to clean it up before we can use it:
//
// The band countries are wrong: all the bands should have 'Canada' as the country.
// The band name should have all words capitalized.
// Remove all dots from the band names.
//
// Write a function that can process the input band Array and return an
// Array that contains the fixed information:

// input - array of objects
// output - array of objects
//
// rules:
// - return the input array with the following changes:
//   - the band country is set as Canada
//   - the band name should have all words capitalized
//   - there should be no dots in the band name
//
// algorithm:
// - use the #map method on the input array
//   - return a new object
//     - split the name into an array, capitalize each word, join back together
//     - remove dots using #replace
//     - set the country as canada

var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(data) {
  return data.map(function (band) {
    return {
      name: formatName(band.name),
      country: 'Canada',
      active: band.active,
    }
  });
}

function formatName(name) {
  return name.replace(/\./, '').split(' ').map(function (word) {
    return word[0].toUpperCase() + word.slice(1);
  }).join(' ');
}

console.log(processBands(bands));

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]
