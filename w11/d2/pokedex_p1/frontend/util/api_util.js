export const fetchAllPokemon = () => {
    //fetch all the pokemon
    // debugger
    return $.ajax({
        url: `/api/pokemon`,
        method: `get`,
    });
};

export const fetchPokemonDetail = (poke_id) => {
    debugger
    return $.ajax({
        url: `api/pokemon/${poke_id}`,
        method: 'get'
    })
}
