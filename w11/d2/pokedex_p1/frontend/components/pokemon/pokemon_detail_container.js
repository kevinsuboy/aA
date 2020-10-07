import { connect } from "react-redux"
import PokemonDetail from "./pokemon_detail"
import { requestPokemonDetail } from "../../actions/pokemon_actions"
import { selectPokemonDetail } from "../../reducers/selectors.js"

const mapStateToProps = (state) => {
    const items = selectPokemonDetail(state) //array 
    return ({
        items: items
    })
}

const mapDispatchToProps = (dispatch) => {
    return ({
        requestPokemonDetail: (pokemonId) => {
            return dispatch(requestPokemonDetail(pokemonId));
        }
    })
}
export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)
