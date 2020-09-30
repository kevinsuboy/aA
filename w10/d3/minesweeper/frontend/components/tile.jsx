import React from 'react';
import * as Minesweeper from '../lib/minesweeper'

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.state = {explored: false, flagged: false}
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        let flagged = false;
        if (e.altKey && !this.state.explored) {
            flagged = true;
        }
        const status = this.props.updateGame(this.props.tile_obj, flagged);
        if (status) {
            // this.props.restartGame();
        }
    }

    render() {
        let text = "";
        // let text = "\uD83D\uDC04";
        const t = this.props.tile_obj;
        let class_name = "tile";
        if (t.explored) {
            class_name += " explored";
            const cnt = t.adjacentBombCount();
            text = cnt===0 ? "":cnt;
            if (t.bombed) {
                text = "💣"
            }
        } else if (t.flagged) {
            text = "🇰🇵"
        }
        return (
            <div
                className={class_name}
                onClick = {this.handleClick}
                key={this.props.banana}>
                {text}
            </div>
        )
    }
}


// U + 1F4A3 // bomb
// U + 1F4A5 // explode