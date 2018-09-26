function Vehicle() {
  if (!(this instanceof Vehicle)) {
    return new Vehicle();
  }

  return this;
}

Vehicle.prototype = {
  doors: 4,
  wheels: 4,
};

var sedan = new Vehicle();
var coupe = new Vehicle();
coupe.doors = 2;

function Coupe() {
  if (!(this instanceof Vehicle)) {
    return new Vehicle();
  }

  return this;
}

Coupe.prototype = new Vehicle();
Coupe.prototype.doors = 2;

function Motorcycle() {
  var o = this;

  if (!(this instanceof Vehicle)) {
    o new Motocycle();
  }
  o.doors = 0;
  o.wheels = 2;

  return o;
}

Motorcycle.prototype = Vehicle();

var crx = new Coupe();
var monster = new Motorcycle();

console.log(monster);

Sedan.prototype = Object.create(Vehicle.prototype);

console.log(new Sadan());
