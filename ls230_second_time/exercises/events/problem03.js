// var domElement = document.querySelector('p');
// > makeBold(domElement, function(elem) {
//     if (elem.tagName === 'SECTION') {
//       elem.classList.add('highlight');
//     }
//   });
//
// > domElement.classList.contains('highlight');
// = false
// > domElement.style.fontWeight;
// = "bold"
//
// > domElement = document.querySelector('section');
// > makeBold(domElement, function(elem) {
//     if (elem.tagName === 'SECTION') {
//       elem.classList.add('highlight');
//     }
//   });
//
// > domElement.classList.contains('highlight');
// = true
// > domElement.style.fontWeight;
// = "bold"

function makebold(domElement, callback) {
  domElement.style.fontWeight = 'bold';
  callback(domElement);
}
