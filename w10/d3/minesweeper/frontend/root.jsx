import React from "react";
import Game from "./components/Game";


const Root = () => {
    return (
        <div>
            <Game gridSize={9} numBombs={10} />
        </div>
    )
}

export default Root;