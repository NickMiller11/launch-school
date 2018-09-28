// Classical Model

function Soldier(name, rank) {
  this.name = name;
  this.rank = rank;
}

Soldier.prototype.shoot = function(target) {
  console.log("I'm shooting at " + target + "!");
};

Soldier.prototype.firstAid = function() {
  console.log("I need some medical assistance!")
};

var frank = new Soldier('Frank', 'Private First Class');
var yusuke = new Soldier('Yusuke', 'Private Second Class');

frank.shoot('the enemy');
yusuke.firstAid();

function Sniper(name, rank) {
  Soldier.call(this, name, rank);
  this.confirmedKills = 0;
}

// creates a new Sniper.prototype which points to Soldier.prototype
Sniper.prototype = Object.create(Soldier.prototype);

// the old Sniper.prototype gets garbage collected

// the constructor property of the new Sniper.prototype points back to the
// Sniper function in case we want to use it
Sniper.prototype.constructor = Sniper;

Sniper.prototype.shoot = function(target) {
  console.log("I'm aiming at " + target + ".");
}

function MasterSniper(name, rank) {
  Sniper.call(this, name, rank);
}

var jesse = new Sniper('Jesse', 'Corporal');

jesse.shoot('a terrorist');

MasterSniper.prototype = Object.create(Sniper.prototype);
MasterSniper.prototype.constructor = MasterSniper;

MasterSniper.prototype.teach = function() {
  console.log("I'm teaching new recruits how to aim properly.")
}

var kai = new MasterSniper('Kai', 'Sergeant Major');

kai.shoot('someone far away');
kai.teach();

console.log(Object.getPrototypeOf(frank) === Soldier.prototype);
console.log(Object.getPrototypeOf(jesse) === Sniper.prototype);
console.log(Object.getPrototypeOf(kai) === MasterSniper.prototype);
