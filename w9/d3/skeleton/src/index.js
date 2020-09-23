const View = require("./ttt-view.js")
const Game = require("./game.js")

  $(() => {
    // Your code here
    // instantiating stuff here (new View, new Game etc.)
    window.game = new Game();
    window.view = new View(game, $(".ttt"))
    // const $ttt = $(".ttt") //! kevin goes on tangents
    // debugger //! kevin goes on tangents
  });

