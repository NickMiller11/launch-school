// var sedan = {
//   speed: 0,
//   rate: 8,

//   accelerate: function() {
//     this.speed += this.rate;
//   },

// };

// var coupe = {
//   speed: 0,
//   rate: 12,

//   accelerate: function() {
//     this.speed += this.rate;
//   },
// };

function makeCar(rateOfAccel, rateOfBrake) {
  return {
    speed: 0,
    rate: rateOfAccel,
    brakingRate: rateOfBrake,

    accelerate: function() {
      this.speed += this.rate;
    },

    brake: function() {
      if (this.speed - this.brakingRate < 0) {
        this.speed = 0
      } else {
        this.speed -= this.brakingRate;
      }
    },
  };
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

// var hatchback = makeCar(9);
// hatchback.accelerate();
// console.log(hatchback.speed);