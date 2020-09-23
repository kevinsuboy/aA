const Game = require("./game");

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $(".ttt").on("click", "li", (event) => {
      const $square = $(event.target); // extracts the <li> element
      this.makeMove($square);
    })
  }

  makeMove($square) {
 
    let elId = $square.attr("id");
    let pos = elId.split(",").map(el=>{return Number(el)});
    try {
      let currentPlayer = this.game.currentPlayer; //! X or O
      this.game.playMove(pos); //! switches player under the hood
      $square.addClass(currentPlayer) // add either X or O
      $square.removeClass("empty")
    } catch(err) {
      alert(err.msg)
    }
    if (this.game.isOver()) {
      this.$el.off("click")
      let winnerStr = this.game.winner(); //! "x" "o"
      let loserStr = "";
      if(winnerStr === "x"){
        loserStr = "o";
      }else{
        loserStr = "x";
      }
      let $winner = $(`.${winnerStr}`);// extract winners by jQuery the className of "game.winner()"
      let $loser = $(`.${loserStr}`);// extract losers by jQuery classname complement of "game.winner()" (if/else)
      $winner.addClass("WON");// "append" class of WON to winners
      $loser.addClass("LOSE");// "append" class of LOSE to losers
      // append <p> to figure "you win etc."
      const $p = $(`<p>You won, ${winnerStr}!</p>`)
      this.$el.append($p);
      //! make everyone non empty
      let $others = $(".empty")
      $others.removeClass("empty")
    }

    //this.game.isOver() => true/false
    //this.game.winner(); => x or o
  }

  setupBoard() {
    const $ul = $("<ul></ul>")

    for (let row = 0; row < 3; row++) {
      for(let col = 0; col < 3; col++) {
        const $li = $(`<li></li>`)
        $ul.append($li);
        $li.attr("id", [row, col]) //ex) id = "0,0"
        $li.addClass("empty");
        // $li.attr("style","background: lightgray");
      }
    }
    $ul.attr("style", "background: lightgray");
    this.$el.append($ul)
  }
}

module.exports = View;
