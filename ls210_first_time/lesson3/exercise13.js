function generatePattern(n) {
  var start_num = 1;
  var asterisk
  while (start_num < n) {
    asterisk = '*'.repeat(n - start_num)
    console.log(`${start_num}${asterisk}`);
    start_num++;
  }
}

generatePattern(7);