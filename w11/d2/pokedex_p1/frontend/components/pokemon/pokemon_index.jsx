import React from "react"
import PokemonIndexItem from "./pokemon_index_item"
import { Route } from "react-router-dom";
import PokemonDetailContainer from "./pokemon_detail_container"

class PokemonIndex extends React.Component {
    componentDidMount() {
        this.props.requestAllPokemon();
    }
    render () {
        // debugger
        const pokemonItems = this.props.pokemon.map(poke => (
            <PokemonIndexItem key={poke.id} pokemon={poke} />
            ));
        return(
            <section className="pokemon">
                <Route path = "/pokemon/:pokemonId" component = { PokemonDetailContainer } />
                <ul>{pokemonItems}</ul>
            </section>
        )
    }
}

export default PokemonIndex;