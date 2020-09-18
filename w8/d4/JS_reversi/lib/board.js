let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);

  for (let i=0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  x = pos[0]; y = pos[1];
  return !(x < 0 || y < 0 || x > 7 || y > 7);
  
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  // ruby: raise "ba;lskjf;lasj"
  // js: throw "belhh"

  if ( !this.isValidPos(pos) ) {
    throw new Error('Not valid pos!');
    // throw new Error(message);
  }
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  
  let piece = this.getPiece(pos); // will throw if falsey

  if (piece){
    return piece.color === color;
  }
  // return true; // expecting 'falsey'... if we don't return, "undefined" is implicitly return (which is falsey)
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  // exploit 'truthy/falsey' of getPiece
  // use .getPiece to check if valid pos first
  return Boolean(this.getPiece(pos));
  // getPiece --- > Object<Piece> or 'undefined' (result of the THROW)
  // convert ty truthy    T            F
  
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip /*=[]*/ ){
// function(pos, color, dir)
  // this is the FIRST time we enter PTF
    // piecesTF is [] atm
  // color = RED
  // piecesToFlip = (piecesToFlip || new Array);
  piecesToFlip || (piecesToFlip = new Array);

  let nextPos = new Array(2);
  nextPos[0] = pos[0] + dir[0];
  nextPos[1] = pos[1] + dir[1];
  // nextPos color is (also) Red
  // --------------- BAAAAASSSSSSEEEEEEE CCCAAAAASSSSSEEEE -----------
  if (!this.isValidPos(nextPos) || !this.isOccupied(nextPos)) {
    return [];
  }
  if (this.isMine(nextPos, color) ) { // RED === RED
    // piecesToFlip.push(pos);
    return piecesToFlip; // piecesTF is [], we're OK
  }
  // --------------- INDUCTIVE STEP -----------
    piecesToFlip.push(nextPos);
    return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
};

// WRAPPING FUNCTION{
//   PLACED A PIECE
//   GO RIGTH
//   PTF(pos, COLOR, RIGHT)
//   piecesToFlip --> [2,3,4]

// }

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;
