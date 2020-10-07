//actions are just objects with the type property 
import * as APIUtil from "../util/api_util"

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON_DETAIL = "RECEIVE_POKEMON_DETAIL";


//action creator
export const receiveAllPokemon = (pokemons) => { // function where we are creating actions
    // debugger 
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemons
    }
}

export const receivePokemonDetail = (pokemon_details) => { // function where we are creating actions
  // debugger
  return {
    type: RECEIVE_POKEMON_DETAIL,
    // shirt: shirt // perfectly fine BUT...
    pokemon_details // dis line, line 20, does ^ short hand notation
  }
}

export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const requestPokemonDetail = (pokemonId) => (dispatch) => (
    APIUtil.fetchPokemonDetail(pokemonId)
        .then(pokemon => dispatch(receivePokemonDetail(pokemon)))
)