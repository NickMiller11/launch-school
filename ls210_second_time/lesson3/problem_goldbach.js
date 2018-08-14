// input - integer
// output - one or more integer pairs

// rules:
// - log any pair of prime integers who sum up to the input number
// - the smaller digit should appear first
// - return null for any input that is odd or less than 4

// algorith:
// - create a guard clause and return null for odd inputs and inputs less than 4
// - declare 2 variables for prime1 and prime2
// - create a for loop - while prime 1 is less than input / 2
//   - check if prime1 and prime2 are both prime
//   - if so, log both numbers to the screen
//   - increment prime1 by 1, decrement prime2 by 1

function isPrime(int) {
  if (int <= 1 || (int > 2 && int % 2 === 0)) {
    return false;
  }

  var divisor;

  for (divisor = 3; divisor < int / 2; divisor += 2) {
    if (int % divisor === 0) {
      return false;
    }
  }

  return true;
}

function checkGoldbach(sum) {
  if (sum % 2 !== 0 || sum < 4) {
    console.log(null)
    return;
  }

  var prime1;
  var prime2;
  for (prime1 = 2, prime2 = sum - 2; prime1 <= sum / 2; prime1 += 1, prime2 -= 1) {
    if (isPrime(prime1) && isPrime(prime2)) {
      console.log(prime1 + ' ' + prime2);
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