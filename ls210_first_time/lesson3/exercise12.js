
function isPrime(n) {
  if (n < 2) {
    return false;
  }

  var divisor;
  for (divisor = n - 1; divisor >= 2; divisor--) {
    if (n % divisor === 0) {
      return false;
    }
  }

  return !!divisor;
}

function checkGoldbach(n) {
  if (n % 2 === 1 || n < 4 || isPrime(n)) {
    console.log(null);
    return;
  }

  var lower_num
  var higher_num

  for (lower_num = 1, higher_num = n - 1; lower_num <= higher_num; lower_num++, higher_num--) {
    if (isPrime(lower_num) && isPrime(higher_num)) {
      console.log(`${lower_num} ${higher_num}`);
    }
  }
}


checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53