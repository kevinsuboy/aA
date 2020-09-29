// Write a function, `longestSymmetricSubstring(string)`, that returns the
// longest substring that is the same forwards and in reverse (for example,
// "abba"). If two substrings are the same length, take the first one.
function longestSymmetricSubstring(str){
    const N = str.length;
    for(let l=N;l>=1;l--){
        for(let i=0;i+l<=N;i++){
            if(isSymmetric(str.slice(i,i+l))) return str.slice(i,i+l);
        }
    }
}
function isSymmetric(str){
    const N = str.length;
    for(let i=0;i<Math.floor(str.length/2);i++){
        if(str[i] !== str[N-1-i]) return false;
    }
    return true;
}

// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. 
//
// **Do NOT use the built-in `Array.prototype.forEach` method in your 
// implementation.**
Array.prototype.myEach = function(cb){
    for(let i=0;i<this.length;i++){
        cb(this[i]);
    }
}


// Write an `Array.prototype.myMap(callback)` method, that takes a callback and 
// returns a new array containing the result of the callback for each element in 
// the array. Use the `Array.prototype.myEach` method you defined above. 
//
// **Do NOT call the built-in `Array.prototype.forEach` or `Array.prototype.map` 
// methods in your implementation.**
Array.prototype.myMap = function(cb){
    const res = [];
    this.myEach(
        el => {
            res.push(cb(el));
        }
    )
    return res;
}


// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.
//
// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }
function pairMatch(arr,cb){
    const res = [];
    for(let i=0;i<arr.length;i++){
        for(let j=0;j<arr.length;j++){
            if(cb(arr[i],arr[j]) && i!==j) res.push([i,j]);
        }
    }
    return res;
}


// Write a recursive function, `binarySearch(sortedArray, target)`, that returns
// the index of `target` in `sortedArray`, or -1 if it is not found. 
//
// **Do NOT use the built-in `Array.prototype.indexOf` or
// `Array.prototype.includes` methods in your implementation.**
//
// Here's a quick summary of the binary search algorithm:
//
// Start by looking at the middle item of the array. If it matches the target,
// return its index. Otherwise, recursively search either the left or the right
// half of the array until the target is found or the base case (empty array) is
// reached.
function binarySearch(arr,target){
    if(arr.length < 1) return -1;
    const m = Math.floor((arr.length-1)/2);
    if(arr[m] === target) return m;
    if(arr[m] < target){
        let r = binarySearch(arr.slice(m+1),target);
        return r === -1 ? -1 : r+m+1;
    }else{
        return binarySearch(arr.slice(0,m),target);
    }
}


// Write a `Function.prototype.myBind(context)` method. It should return a copy
// of the original function, where `this` is set to `context`. It should allow 
// arguments to the function to be passed both at bind-time and call-time.
Function.prototype.myBind = function(ctx,...bindArgs){
    const fn = this;
    return function _bound(...callArgs){
        return fn.apply(ctx,bindArgs.concat(callArgs));
    }
}

// Write a function, `inherits(ChildClass, ParentClass)`. It should extend the
// methods of `ParentClass.prototype` to `ChildClass.prototype`. 
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**
function inherits(ChildClass, ParentClass){
    function S(){};
    S.prototype = ParentClass.prototype;
    ChildClass.prototype = new S();
    ChildClass.prototype.constructor = ChildClass;
}

// Write a function `myCurry(fn, object, numArgs)`, that curries the function.
// Remember that a curried function is invoked with one argument at a time. For
// example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.
function myCurry(fn,obj,numArgs){
    const N = numArgs;
    const curriedArgs = [];
    return function _curried(...args){
        curriedArgs.push(...args);
        if(curriedArgs.length >= N) return fn.apply(obj,curriedArgs);
        else return _curried;
    }
}
