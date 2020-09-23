const Asteroid = require("./asteroid");
const Ship = require("./ship");

function Game(){
    this.DIM_X = 1000;
    this.DIM_Y = 1000;
    this.NUM_ASTEROIDS = 4;
    this.addAsteroids();
    this.ship = new Ship({
        pos: this.randomPosition(),
        game: this
    });
}
Game.prototype.addAsteroids = function() {
    this.asteroids = [];
    for(let i = 0; i < this.NUM_ASTEROIDS; i++){
        this.asteroids.push(new Asteroid({
            pos: this.randomPosition(),
            game: this
        }));
    }
    // debugger
    return true;
}
Game.prototype.randomPosition = function() {
    // debugger
    return [Math.floor(Math.random() * this.DIM_X), Math.floor(Math.random() * this.DIM_Y)];
}
Game.prototype.draw = function(ctx) {
    // debugger
    ctx.clearRect(0,0,this.DIM_X,this.DIM_Y);
    this.allObjects().forEach(
        el => el.draw(ctx)
    );
}
Game.prototype.moveObjects = function() {
    debugger
    this.allObjects().forEach(
        el => el.move()
    );
}
Game.prototype.wrap = function(pos) {
    pos[0] = (pos[0] + this.DIM_X) % this.DIM_X;
    pos[1] = (pos[1] + this.DIM_Y) % this.DIM_Y;
    return pos;
}
Game.prototype.checkCollisions = function() {
    let allObjs = this.allObjects();
    for(let i = 0; i<allObjs.length; i++){
        for(let j = 0; j<allObjs.length; j++){
            if(i!==j){
                if (allObjs[i].isCollidedWith(allObjs[j])){
                    // alert("COLLISION");
                    (allObjs[i]).collideWith(allObjs[j]);
                }
            }
        }
    }
}
Game.prototype.allObjects = function() {
    return [...this.asteroids,this.ship]
}

Game.prototype.step = function() {
    this.moveObjects();
    this.checkCollisions();
}
Game.prototype.remove = function(asteroid){
    let i = this.asteroids.indexOf(asteroid);
    this.asteroids.splice(i,1);
}
module.exports = Game;