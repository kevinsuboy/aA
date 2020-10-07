import { RECEIVE_POKEMON_DETAIL } from '../actions/pokemon_actions';
const itemsReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_POKEMON_DETAIL:
            return nextState = action.pokemon_details.items;
        default:
            return state;
    }
}

export default itemsReducer