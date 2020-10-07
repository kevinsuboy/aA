import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON_DETAIL } from '../actions/pokemon_actions';
const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state); 
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            return nextState = action.pokemons;
        case RECEIVE_POKEMON_DETAIL:
            nextState[action.pokemon_details.pokemon.id] = action.pokemon_details.pokemon;
            return nextState;
        default:
            return state;
    }
}

export default pokemonReducer