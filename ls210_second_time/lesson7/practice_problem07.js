// Write a Function named processReleaseData that processes the following movie release data:
//
// The Function should generate an Array of Objects that contain only the id and
// title key/value pairs. You may assume that id, when existing, is an integer
// greater than 0. Here are the rules:
//
// Keep only releases that have both id and title data present.
// Keep only the id and title data for each release.

// should return:
// [{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }];

// input - array of Objects
// output - array of Objects
//
// rules:
// - return an object that contains the id and title key/value pairs from the input
// - only include releases that have both an id and title
// - ids should be greater than 0
//
// algorithm:
// This looks like a filter exercise, so I should use the filter method on the Array
// The criteria for the filter should be both an existant id and titles
// Then I can use map to include only id and titles

// The current solution assumes that the value of id will be an integer value
// greater than 0. If it was possible to have a value of 0 for id, what would
// the implications be to the current solution? What changes, if any, would
// need to be made in order to handle the 0 value?

function processReleaseData(data) {
  return data.filter(function (movie) {
    return (movie.id || movie.id === 0) && movie.title;
  }).map(function (movie) {
    return {
      id: movie.id,
      title: movie.title,
    }
  });
}

var newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'id': 000000,
    'title': 'The Matrix',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
];

console.log(processReleaseData(newReleases));
