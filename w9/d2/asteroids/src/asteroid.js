const Util = require("./utils.js");
const Ship = require("./ship.js");
const MovingObject = require("./moving_object.js");

function Asteroid(options){
    const COLOR = "red";
    const RADIUS = 10;
    MovingObject.call(this,{
        pos: options.pos,
        vel: Util.randomVec(10),
        radius: RADIUS,
        color: COLOR,
        game: options.game
    });
}
Util.inherits(Asteroid, MovingObject);


Asteroid.prototype.collideWith = function(obj){
    // console.log('ship hit!!!')
    if(obj instanceof Ship){
        // debugger
        obj.relocate();
    }
}

module.exports = Asteroid;
