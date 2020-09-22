class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

Function.prototype.myBind1 = function (context){
    //? do something with arguments
    // "this" is a Function
        // need to do a that is this?
    // let bound = arguments[0]; // this is that
    // let args = [];
    // for(let i=1;i<arguments.length;i++){
    //     args.push(arguments[i]);
    // }
    // return bound.this(...args);


    const fn = this; // that is this SAYS
    const bindArgs = Array.from(arguments).slice(1) // excluding 0th
    debugger
    return function _bound(){
        const callArgs = Array.from(arguments);
        return fn.apply(context,bindArgs.concat(callArgs))
    }
    // return bound.this()
    // console.log('I am myBind1');
}

Function.prototype.myBind2 = function(context, ...args) {

    const fn = this; 
    const bindArgs = args;

    return function _bound2(...args) {
        const callArgs = args;
        return fn.apply(context, bindArgs.concat(callArgs))
    } 

}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// let res1 = markov.says.myBind1(pavlov, "Hello World!") // receiver is "markov.says"
// // res1 is the return of line 19-> (returned ANONYM _bound (Function))
// res1() // receiver is WINDOW... arguments is []
// //! Play around
// markov.says.myBind1("this_func", "h", "w", "q", "e", "b") // receiver is "markov.says"
// let fn = markov.says.myBind1() // becomes anonymous (Function)
// debugger
// markov.says.myBind1()(); // receiver is window
// fn();
// // above becomes "anonymous()"
// let func = markov.says.myBind1; // "func" is just Function
// func(); // "receiver" in this case is just the windo
//! Play around

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind1(pavlov, "meow", "Kush")();
markov.says.myBind2(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind1(pavlov)("meow", "a tree");
markov.says.myBind2(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind1(pavlov, "meow")("Markov");
markov.says.myBind2(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind1(pavlov);
notMarkovSays("meow", "me");
const notMarkovSays2 = markov.says.myBind2(pavlov);
notMarkovSays2("meow", "me");
// Pavlov says meow to me!
// true