export const allTodos = ({ todos }) => {
    //debugger
    return (
        Object.keys(todos).map(id => todos[id])
    )
};