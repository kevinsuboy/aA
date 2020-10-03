import React from 'react';
import TodoList from './todo_list';

const TodoListItem = (props) => {
    return(
        <li className="todo-list-item">
            <h1>{props.todo.title}</h1>
            <p>{props.todo.body}</p>
        </li>
    )
}

export default TodoListItem;