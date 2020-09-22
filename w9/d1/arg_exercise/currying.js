function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30


Function.prototype.curry = function (n_args){
    const N = n_args; // decr as we go
    let nums = []; // compare nums.length
    //
    let fn = this; // fn === sumThree
    let fn2 = function _curriedSum() {
        nums.push(arguments[0]);
        if(nums.length === N){
            return fn(...nums);
        } else {
            debugger
            return fn2; // needs to return _curriedSum (Function)
        }
    }
    return fn2;
}

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30 (sumThree)
console.log(f1)

// or more briefly:
let res = sumThree.curry(3)(4)(20)(6); // == 30
console.log(res)