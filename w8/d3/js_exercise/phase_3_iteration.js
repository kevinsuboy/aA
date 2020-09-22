// Array#bubbleSort
Array.prototype.bubbleSort = function () {
    function comp(el1,el2) {
        return el1 > el2;
    }
    let isSorted = false;
    let tmp = 0;
    while (isSorted) {
        isSorted = true;
        for (let i = 0; i < (this.length - 1); i++) {
            if(comp(this[i],this[i + 1])){
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                isSorted = false;
            }
        }
    }
    
    return this;
};

console.log([5, 3, 4, 2, 1].bubbleSort());

// String#substrings
String.prototype.substrings = function () {
    let res = [];
    for(let i=0;i<this.length;i++){
        for(let j=i+1;j<=this.length;j++){
            res.push(this.slice(i,j));
        }
    }
    return res;
};

console.log("abc".substrings());
