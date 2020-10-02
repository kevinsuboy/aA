import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions'
// const initialState = {
//     1: {
//         id: 1,
//         title: "wash car",
//         body: "with soap",
//         done: false
//     },
//     2: {
//         id: 2,
//         title: "wash dog",
//         body: "with shampoo",
//         done: true
//     }
// };
const todosReducer = (state = {}, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    switch(action.type) { //! may need editing
        case RECEIVE_TODOS:
            // nextState[action.todos.id] = action.todos; //! may need "MAP"
            // action.todos = [pojo1,pojo2...]
            action.todos.forEach(
                pojo => nextState[pojo.id] = pojo
            )
            return nextState
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState
        default: 
            return state;
    }
}




export default todosReducer;