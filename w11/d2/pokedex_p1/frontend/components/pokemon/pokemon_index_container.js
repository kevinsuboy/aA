import { connect } from "react-redux"
import PokemonIndex from "./pokemon_index.jsx"
import { requestAllPokemon } from "../../actions/pokemon_actions"
import { selectAllPokemon } from "../../reducers/selectors.js"

const mapStateToProps = (state) => {
    const pokemon = selectAllPokemon(state) //array 
    return ({
        pokemon: pokemon
    })
}

const mapDispatchToProps = (dispatch) => {
    return ({
        requestAllPokemon: () => {
            return dispatch(requestAllPokemon());
        }
    })
}
export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex)
