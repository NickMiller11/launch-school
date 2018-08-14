var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();

// function average(arr) {
//   return sum(arr) / arr.length;
// }

// function sum(arr) {
//   var total = 0;
//   var i;

//   for (i = 0; i < arr.length; i += 1) {
//     total += arr[i];
//   }

//   return total;
// }

// var temperatures = [84, 80, 77, 76, 76];

// console.log(average(temperatures));
