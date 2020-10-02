export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";


export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos // shorthand for todos: todos
    }
}
export const receiveTodo = (todo) => { //! will have to change
    return {
        type: RECEIVE_TODO,
        todo // shorthand for todo: todo
    }
}