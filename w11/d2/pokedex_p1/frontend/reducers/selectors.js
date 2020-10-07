export const selectAllPokemon = (state) => {
    return Object.values(state.entities.pokemon)
}
export const selectPokemonDetail = (state) => {
    return Object.values(state.entities.items)
}
