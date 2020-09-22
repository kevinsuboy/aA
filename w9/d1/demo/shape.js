// function Shape(color){
//     this.color = color;
// }

// // const blueShape = new Shape("blue")
// // debugger
// // console.log(blueShape)
// // debugger
// Shape.prototype.sayHello = function (){
//     console.log(`hello, I am ${this.color}`)
// }
// // debugger
// // let s = "s"

class Shape{
    constructor(color){
        this.color = color;
    }
    sayHello(){
        console.log(`hello, I am ${this.color}`);
    }
}

module.exports = Shape;