function findAllParagraphs() {
  var matches = [];
  var nodes = document.body.childNodes;

  for (var i = 0; i < nodes.length; ++i) {
    if (nodes[i] instanceof HTMLParagraphElement) {
      matches.push(nodes[i]);
    }
  }

  return matches;
}

console.log(findAllParagraphs());

// function addClassToParagraphs(node) {
//   if (node instanceof HTMLParagraphElement) {
//     node.classList.add('article-text');
//   }
//
//   var nodes = node.childNodes;
//   for (var i = 0; i < nodes.length; ++i) {
//     addClassToParagraphs(nodes[i]);
//   }
// }
//
// addClassToParagraphs(document.body);

function getElementsByTagName(tagName) {
  var matches = [];

  walk(document.body, function(node) {
    if (node.nodeName.toLowerCase() === tagName) {
      matches.push(node);
    }
  });

  return matches;
}

getElementsByTagName('p').forEach(function(paragraph) {
  paragraph.classList.add('article-text');
})

var paragraphs = document.getElementsByTagName('p');
for (var i = 0; i < paragraphs.length; i++) {
  paragraphs[i].classList.add('article-text');
}

var intros = document.getElementsByClassName('intro');
for (var i = 0; i < intros.length; i++) {
  var paragraphs = intros[i].getElementsByTagName('p');
  for (var p = 0; p < paragraphs.length; p++) {
    paragraphs[p].classList.add('article-text');
  }
}
