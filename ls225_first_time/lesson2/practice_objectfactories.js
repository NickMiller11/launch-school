function makeCar(rate, brake) {
  return {
    speed: 0,
    rate: rate,
    accelerate: function () {
      this.speed += this.rate;
    },
    brake: function() {
      this.speed -= brake;

      if (this.speed < 0) {
        this.speed = 0;
      }
    },
  }

}

var sedan = makeCar(8, 6);
sedan.accelerate();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);

// var coupe = makeCar(12);
// coupe.accelerate();
// console.log(coupe.speed);

// var hatchback(9);
