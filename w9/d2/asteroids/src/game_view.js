function GameView(game,ctx){
    this.game = game;
    this.ctx = ctx;
}
GameView.prototype.start = function () {
    // debugger
    let g = this.game;
    let c = this.ctx;
    // g.draw(c);
    this.bindKeyHandlers();
    setInterval(function(){
        g.step.bind(g)();
        g.draw(c);
        console.log('moved asteroids');
    }, 20);
}
GameView.MOVES = {
    w: [0, -1],
    a: [-1, 0],
    s: [0, 1],
    d: [1, 0],
};
GameView.prototype.bindKeyHandlers = function() {
    const ship = this.game.ship;
    Object.keys(GameView.MOVES).forEach(function (k) {
        const move = GameView.MOVES[k];
        key(k, function () { ship.power(move); });
    });

    // key("space", function () { ship.fireBullet(); });
}

module.exports = GameView;
