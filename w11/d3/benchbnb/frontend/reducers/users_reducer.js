import { RECEIVE_CURRENT_USER } from "../actions/session_actions" // DATS TIGHT

const usersReducer = (state = {}, action) => {
    Object.freeze(state); // not allowing ourselves to modify state
    // let nextState = Object.assign({}, state); // makes us a copy of state 

    switch (action.type) { // dis be a fancy if else
        case RECEIVE_CURRENT_USER:
            // nextState[action.user.id] = action.user
            return Object.assign({}, state, { [action.user.id]: action.user })
            // return nextState
        default:
            return state;
    }
}

export default usersReducer