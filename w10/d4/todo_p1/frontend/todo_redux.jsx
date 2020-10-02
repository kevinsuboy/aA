import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store'
import { receiveTodo } from './actions/todo_actions';
import { receiveTodos } from './actions/todo_actions';

document.addEventListener("DOMContentLoaded", () => {
    const content = document.getElementById("content"); //vanilla js
    const store = configureStore();
    ReactDOM.render(<Root />, content); // dis be react
    // dumb comment
    window.store = store
    window.receiveTodo = receiveTodo
    window.receiveTodos = receiveTodos
})
