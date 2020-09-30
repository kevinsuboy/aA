import React from 'react';
import * as Minesweeper from '../lib/minesweeper'
import Tile from './tile'

export default class Board extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        const grid = this.props.board_obj.grid.map(
            (row, i) => {
                const content = row.map(
                    (tile_obj, j) => {
                        const banana = `${i}-${j}`
                        return <Tile 
                        key = {banana}
                        tile_obj={tile_obj} 
                        updateGame={this.props.updateGame}
                        restartGame={this.props.restartGame}
                        />
                    }
                )
                return(
                    <div className="row" key={i}>{content}</div>
                )
            }
        )
        return (
            <div className="board">
                <h1>This is Board REACT</h1>
                <div className="grid">{grid}</div>
            </div>
        )
    }
}
