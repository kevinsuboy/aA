// const rectangle = require("./rectangle.js")
//window.rectangle = rectangle

console.log("Webpack is working!")

const Util = require("./utils.js")
const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js")
const Game = require("./game.js")
const GameView = require("./game_view.js")
window.Asteroid = Asteroid;
window.MovingObject = MovingObject;


document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById('game-canvas');
    const ctx = canvas.getContext('2d');
    // const mo = new MovingObject({
    //     pos: [30, 30],
    //     vel: [10, 10],
    //     radius: 5,
    //     color: "#00FF00"
    // });
    // mo.draw(ctx);
    // const ast = new Asteroid({
    //     pos: [100,100]
    // });
    // ast.draw(ctx);
    const g = new Game();
    const gv = new GameView(g, ctx);
    gv.start();
    // let ast = g.asteroids;
    // ast[0].draw(ctx);
    // debugger
});
