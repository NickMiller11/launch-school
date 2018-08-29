// input - string
// output - boolean

// rules:
// - return a boolean to confirm whether input string is a valid email address
// - email address criteria:
//   - one @ sign
//   - local part contains one or more letters and/or digits. No other characters
//   - the domain part must conatin two or more components with a single dot between each
//   - the domain part much contain one or more letters

// algorithm:
// - split email into an array by @
//   - return false if array length doesn't equal 2
// - match the local part to check characters
// - match the domain part to check characters

function isValidEmail(email) {
  var emailArray = email.split('@');
  var domain;
  var local;

  local = emailArray[0];
  domain = emailArray[1];

  if (emailArray.length !== 2 || invalidLocal(local) || invalidDomain(domain)) {
    return false;
  }

  return true;
}

function invalidDomain(domain) {
  var domainParts = domain.split('.');

  if (domainParts.length < 2 || domainParts.includes('') || domainParts.some(ContainNonLetters)) {
    return true;
  }

  return false;
}

function ContainNonLetters(part) {
  return part.match(/[^a-zA-Z]/);
}

function invalidLocal(local) {
  return local.match(/[^a-zA-Z0-9]/)
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false