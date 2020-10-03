import { connect } from "react-redux"
import TodoList from "./todo_list"
import { allTodos } from "../../reducers/selectors"
import { receiveTodo } from "../../actions/todo_actions"
// state = {
//     todos: {
//         1 : {TODO!!!!!!!}
//         2: { TODO!!!!!!!}
//     }
//     filter: {}
// }

const mapStateToProps = (state) => {
    // const todos = Object.values(state.todos)
    return {
        todos: allTodos(state)
    }
}
const mapDispatchToProps = (dispatch) => {
    return {
        receiveTodo: todo => dispatch(receiveTodo(todo))
    }
}

export default connect(mapStateToProps,mapDispatchToProps)(TodoList)