import React from 'react';

class TodoForm extends React.Component {
    constructor(props){
        super(props)
        this.state = {
            title: "",
            body: "",
            id: uniqueId()
        };
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }
    handleSubmit(){
        event.preventDefault();
        const todo = this.state;
        this.props.receiveTodo(todo);
        //! receiveTodo was given to us thru PROPS by mapDispatchToProps.
        //? receiveTodo dispatches an action with "todo" has 'payload'
        this.setState({ //! we just told store "hey do something", now await next
            title: "",
            body: "",
            id: uniqueId() // x0123
        });
    }
    updateTitle(e){
        this.setState({ title: e.target.value });
    }
    updateBody(e) {
        this.setState({ body: e.target.value });
    }
    render(){
        return(
            <form className="todo-form" onSubmit = {this.handleSubmit}>
                <h3>Add a todo item</h3>
                <label> Title
                    <input type="text" value={this.state.title} onChange={this.updateTitle}/>
                </label>
                <label> Body
                    <input type="text" value={this.state.body} onChange={this.updateBody}/>
                </label>
                <input type="submit" value="Add a Todo item"/>
            </form>
        )
    }
}

function uniqueId() { // PTR = x0123
    return new Date().getTime();
}

export default TodoForm;