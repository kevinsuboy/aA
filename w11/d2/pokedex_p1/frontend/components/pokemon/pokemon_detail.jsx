import React from "react"

class PokemonDetail extends React.Component {
    componentDidUpdate(prevProps) {
        debugger
        if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId){
            this.props.requestPokemonDetail(this.props.match.params.pokemonId);
        }
    }
    render() {
        const id = this.props.match.params.pokemonId;
        return (
            <h1 key={id}>PokemonDetail {id} </h1>
        )
    }
}

export default PokemonDetail;