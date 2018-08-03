function generatePattern(n) {
  var start_num = 1;
  var asterisk
  var num_series = ''
  while (start_num <= n) {
    asterisk = '*'.repeat(n - start_num)
    num_series += String(start_num)
    console.log(`${num_series}${asterisk}`);
    start_num++;
  }
}

generatePattern(2);
generatePattern(7);
generatePattern(9);
