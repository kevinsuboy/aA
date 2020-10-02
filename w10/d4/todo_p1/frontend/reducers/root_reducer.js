import { combineReducers } from "redux";
import todosReducer from './todos_reducer'

const rootReducer = combineReducers({
    todos: todosReducer
    // todos: {
        
    // }
})

export default rootReducer;