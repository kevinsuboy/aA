import { createStore } from "redux";
import rootReducer from "../reducers/root_reducer";
// const store = createStore(rootReducer,preLoadedState,enchancer)

//dis all be redux
const configureStore = (preLoadedState = {}) => {
    return createStore(rootReducer, preLoadedState) //we will be returning an empty object for now... tbc
}

export default configureStore 