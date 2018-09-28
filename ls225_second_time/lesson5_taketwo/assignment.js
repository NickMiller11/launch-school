/*
Start by creating a function named Vehicle that will be used to create new
vehicle objects. Define the Vehicle prototype to include properties for doors
and wheels, both set to 4.

Create a new instance of the Vehicle object and assign it to a variable named
sedan. Create a separate instance in a variable named coupe. Change the doors
property on the coupe object to 2. Log the value of sedan.hasOwnProperty("doors")
and coupe.hasOwnProperty("doors"). Note that once you change the object's
property, it is no longer the property that came from the constructor. This can
be useful for checking whether or not the state of an object has changed since created.

Create two new constructors for Coupe and Motorcycle. Have both inherit from the
Vehicle prototype by setting the prototype of each to a new instance of Vehicle.

Set their constructor properties back to their own named functions, which will
allow instances of each constructor to display that it is a type of Coupe or
Motorcycle rather than Vehicle. Create an instance of coupe and motorcycle and
log both to verify they are different object types. Check the coupe's instanceof
(coupe instanceof Coupe) against the Coupe, Vehicle, and Motorcycle constructors
to see how the prototypes are inherited.

Create a new constructor for Sedan. Set the constructor's prototype to be the
return value of a call to Object.create, passing in the Vehicle prototype as
the new object's prototype. Note that this works the same way as the previous
method of creating classes that extend other classes. Checking the sedan's
instanceof against both Sedan and Vehicle will return true.
*/

function Vehicle() {

}

Vehicle.prototype.doors = 4;
Vehicle.prototype.wheels = 4;

var sedan = new Vehicle();
var coupe = new Vehicle();

coupe.doors = 2;

console.log(sedan.hasOwnProperty("doors"));
console.log(coupe.hasOwnProperty("doors"));

console.log(sedan);
console.log(coupe);

function Coupe() {
  Vehicle.call(this);
}

function Motorcycle() {
  Vehicle.call(this);
}

Coupe.prototype = new Vehicle();
Coupe.prototype.constructor = Coupe;
Motorcycle.prototype = new Vehicle();
Motorcycle.prototype.constructor = Motorcycle;

var coupe2 = new Coupe();
var motorcycle = new Motorcycle();

console.log(coupe2 instanceof Coupe);
console.log(coupe2 instanceof Motorcycle);
console.log(coupe2 instanceof Vehicle);

function Sedan() { }

Sedan.prototype = Object.create(Vehicle.prototype);

var sedan2 = new Sedan();

console.log(sedan2 instanceof Sedan);
console.log(sedan2 instanceof Vehicle);
