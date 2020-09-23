const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

function Bullet(options){
    const RADIUS = 20;
    const COLOR = "blue";
    MovingObject.call(this, {
        pos: options.pos,
        vel: options.vel, // Util.randomVec(0),
        radius: RADIUS,
        color: COLOR,
        game: options.game
    });
}
Util.inherits(Bullet, MovingObject);
