import React from "react";
import App from "./app.jsx";
import { Provider } from "react-redux";

const Root = ({store}) => {
    return(
        <div>
            <h1>I am the Root</h1>
            <Provider store={store}>
                <App />
            </Provider>
        </div>
    )
}
export default Root;