import React from 'react';
import TodoListItem from './todo_list_item'
import TodoListForm from './todo_form'

class TodoList extends React.Component {
    render(){
        //! we have acces to this.props.todos
        //? as a result of "mapStateToProps" (file: todo_list_container)
        // this.props.todos is an ARRAY of POJOs
        const todos = this.props.todos.map(
            (todo) => {
                return(
                    <TodoListItem todo={todo} key={todo.id}/>
                )
            }
        )
        return(
            <div className="todo-list">
                <h3>Todo List goes here!</h3>
                <ul>
                    {todos}
                </ul>
                <TodoListForm receiveTodo = {this.props.receiveTodo}/>
            </div>
        )
    }
}

export default TodoList;