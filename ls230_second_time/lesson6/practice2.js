// Write some JavaScript to create a new product by sending a request to the
// JSON API on our web store. To create a product, make a POST request to
// https://ls-230-web-store-demo.herokuapp.com/v1/products. You can find out
// the required parameters by viewing the API documentation.

var request = new XMLHttpRequest();
request.open('POST', 'https://ls-230-web-store-demo.herokuapp.com/v1/product');

request.setRequestHeader('Content-Type', 'application/json');

var data = { 'title': 'Programming Ruby' };
var json = JSON.stringify(data);

request.send(json);
