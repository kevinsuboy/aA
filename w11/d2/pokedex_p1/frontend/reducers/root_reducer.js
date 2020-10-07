// root reducer job is to combine all other reducers
import {combineReducers} from "redux";
import entitiesReducer from "./entities_reducer"

const rootReducer = combineReducers({
    entities: entitiesReducer,
})

export default rootReducer