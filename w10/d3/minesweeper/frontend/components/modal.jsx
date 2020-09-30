import React from "react";

const Modal = (props) => {
    const msg = props.won ? "You have won" : "You have lost";
    return (
        <div className="modal">
            <div className="modal-screen">
            </div>
            <form className="modal-form">
                <h1>{msg}</h1>
                <button
                    onClick={(e)=>{
                        e.preventDefault();
                        props.restartGame();
                    }}>
                Restart</button>
            </form>
        </div>
    )
}

export default Modal;