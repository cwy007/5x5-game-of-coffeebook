// Generated by CoffeeScript 2.0.3
(function() {
  var age, initializeObj, obj, reincarnate, singCountdown;

  age = 99;

  reincarnate = function() {
    return age = 0;
  };

  reincarnate();

  console.log(`I am ${age} years old`);

  singCountdown = function(count) {
    var singBottleCount, singDecrement;
    singBottleCount = function(specifyLocation) {
      var bottleStr, locationStr;
      locationStr = specifyLocation ? 'on the wall' : '';
      bottleStr = count === 1 ? 'bottle' : 'bottles';
      return console.log(`${count} ${bottleStr} of beer ${locationStr}`);
    };
    singDecrement = function() {
      console.log("Take one down, pass it around");
      return count--;
    };
    singBottleCount(true);
    singBottleCount(false);
    singDecrement();
    singBottleCount(true);
    if (count !== 0) {
      return singCountdown(count);
    }
  };

  obj = null;

  initializeObj = function() {
    return obj = 222; // create object with superpowers
  };

  window.onload = initializeObj;

}).call(this);
