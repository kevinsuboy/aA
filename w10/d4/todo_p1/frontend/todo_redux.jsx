import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store'
import { receiveTodo } from './actions/todo_actions';
import { receiveTodos } from './actions/todo_actions';
import { allTodos } from './reducers/selectors'

document.addEventListener("DOMContentLoaded", () => {
    const content = document.getElementById("content"); //vanilla js
    const banana = configureStore();
    ReactDOM.render(<Root store={banana}/>, content); // dis be react

    window.store = banana
    window.receiveTodo = receiveTodo
    window.receiveTodos = receiveTodos

    window.allTodos = allTodos
})


    //! store = {banana} ====>>>
    //! props = {
    //!     store: banana;
    //! }

    //! destructuring results in 
    //! { store: banana} to extract "store" ===> banana
    //? Root({store})


    //! dumb comment

