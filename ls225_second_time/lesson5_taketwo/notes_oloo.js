var Soldier = {
  init: function(name, rank) {
    this.name = name;
    this.rank = rank;
  },

  shoot: function(target) {
    console.log("I'm shooting at " + target + '!');
  },

  firstAid: function() {
    console.log("I need some medical assistance!");
  },
};

// creating our first object that delegates to Soldier
var frank = Object.create(Soldier);
// invoking the init method that applies state using arguments passed in
frank.init('Frank', 'Private First Class');

var yusuke = Object.create(Soldier);
yusuke.init('Yusuke', 'Private Second Class');

frank.shoot('the enemy');
yusuke.firstAid();

// create an object Sniper that delegates to Soldier
var Sniper = Object.create(Soldier);

Sniper.shoot = function(target) {
  console.log("I'm aiming at " + target + ".");
}

var jesse = Object.create(Sniper);
jesse.init('Jesse', 'Corporal');

jesse.shoot('a terrorist');

// create an object MasterSniper that delegates to Sniper
var MasterSniper = Object.create(Sniper);

MasterSniper.teach = function() {
  console.log("I'm teaching new recruits how to aim properly.");
}

var kai = Object.create(MasterSniper);
kai.init('Kai', 'Sergeant Major')

kai.shoot('someone far away');
kai.teach();
