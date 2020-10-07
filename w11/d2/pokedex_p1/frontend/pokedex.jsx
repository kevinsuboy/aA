// frontend/pokedex.jsx

import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store"

import * as APIUtil from './util/api_util'
import {receiveAllPokemon,requestAllPokemon} from './actions/pokemon_actions'
import Root from './components/root'
import { selectAllPokemon } from './reducers/selectors'
import { HashRouter, Route } from "react-router-dom";

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);





    window.receiveAllPokemon = receiveAllPokemon
    window.requestAllPokemon = requestAllPokemon
    window.fetchAllPokemon = APIUtil.fetchAllPokemon
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.selectAllPokemon = selectAllPokemon;
    // debugger
});