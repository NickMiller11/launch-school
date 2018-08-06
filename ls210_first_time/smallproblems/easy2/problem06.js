
function madlibs() {
  var noun
  var verb
  var adjective
  var adverb

  noun = prompt("Enter a noun:");
  verb = prompt("Enter a verb:");
  adjective = prompt("Enter an adjective:");
  adverb = prompt("Enter an adverb:");

  console.log(`Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`)
}

madlibs()