const newTodos = [
{   id: 1,
    title: "eat breakfast" ,
    body: "cook rice",
    done: false
},
{
    id: 2 ,
    title: "eat lunch" ,
    body: "cook bread",
    done: false
},
{
    id: 3,
    title: "eat dinner" ,
    body: "cook corn",
    done: true
}
];
store.getState(); // should return default state object
store.dispatch(receiveTodo({ id: 3, title: "New Todo" }));
store.getState(); // should include the newly added todo
store.dispatch(receiveTodos(newTodos));
store.getState(); // should return only the new todos
