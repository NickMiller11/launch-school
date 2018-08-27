// input - array of objects
// output - array of objects

// rules:
// - return the input array with the below three changes:
//   - change the country for all bands to Canada
//   - capitalize each word in the band name
//   - remove all dots from the band name

// algorithm:
// - create a new function for each of the 3 changes

var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

// function processBands(data) {
//   bands.map(function (band) {
//     updateCountry(band);
//     capitalizeBandName(band);
//     removeDotsInBandName(band);
//     return band;
//   });

//   return bands;
// }

// function updateCountry(band) {
//   band.country = 'Canada';
// }

// function capitalizeBandName(band) {
//   band.name = band['name'].split(' ').map(function (word) {
//     return word[0].toUpperCase() + word.slice(1);
//   }).join(' ');
// }

// function removeDotsInBandName(band) {
//   band.name = band.name.replace(/\./g, '');
// }

// console.log(processBands(bands));

function processBands(bands) {
  return bands.map(function (band) {
    var capitalizeName = capitalizePhrase(band.name);
    var newBandName = removeDotsInString(capitalizeName);

    return {
      name: newBandName,
      country: 'Canada',
      active: band.active,
    };
  })
}

function capitalizePhrase(phrase) {
  var capitalizedPhrase = phrase.split(' ').map(function (word) {
    return capitalizeString(word);
  }).join(' ');

  return capitalizedPhrase;
}

function capitalizeString(string) {
  var initial = string[0].toUpperCase();
  var rest = string.slice(1, string.length);
  return initial + rest;
}

function removeDotsInString(string) {
  return string.replace(/\./g, '');
}

console.log(processBands(bands));

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]