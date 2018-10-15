var html = document.childNodes[1];
var body = html.lastChild;
var heading = body.childNodes[1];
heading.style.color = 'red';
heading.style.fontSize = '48px';

function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

var count = 0;
walk(document, function(node) {
  if (node.nodeName === 'P') {
    count++;
  }
});

console.log(count);

var words = [];
walk(document, function(node) {
  if (node.nodeName === 'P') {
    var text = node.firstChild.data.trim();
    var firstWord = text.split(' ')[0];
    words.push(firstWord);
  }
});

console.log(words);

var first = true;
walk(document, function(node) {
  if (node.nodeName === 'P') {
    if (first) {
      first = false;
    } else {
      node.classList.add('stanza');
    }
  }
});
