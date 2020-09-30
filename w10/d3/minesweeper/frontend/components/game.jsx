import React from 'react';
import * as Minesweeper from '../lib/minesweeper'
import Board from './Board'
import Modal from "./modal";

export default class Game extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            board_obj: new Minesweeper.Board(this.props.gridSize, this.props.numBombs),
            won: false,lost:false
        };
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(tile_obj, flagged) {
        if (flagged) {
            tile_obj.toggleFlag();
        } else {
            tile_obj.explore();
        }
        const won = this.state.board_obj.won();
        const lost = this.state.board_obj.lost();
        this.setState({ board_obj: this.state.board_obj, won: won, lost: lost});
        // 1: nothing
        // 2: won
        // 3: lost
    }

    restartGame() {
        this.setState(
            {board_obj: new Minesweeper.Board(this.props.gridSize, this.props.numBombs),
            won: false, lost: false}
        )
    }

    render() {
        let m = "";
        if(this.state.won || this.state.lost)
        m = <Modal won={this.state.won}
            restartGame={this.restartGame}
        />
        return (
            <div className="game">
                <h1>This is Game REACT</h1>
                <Board
                    board_obj={this.state.board_obj}
                    updateGame={this.updateGame}
                />
                {m}
            </div>
        )
    }
}
