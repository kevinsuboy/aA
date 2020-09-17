function User(username,age) {
    this.username = username;
    this.age = age;
}
User.prototype.greet = () => 'hello there';