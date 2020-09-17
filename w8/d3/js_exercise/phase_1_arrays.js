/*

console.log("hello world")
// ([1, 2, 2, 3, 3, 3].uniq() => [1, 2, 3])

function f(num){
    console.log(num);
    return null;
}

*/


Array.prototype.uniq = function() {
    let set = new Set(this);
    return Array.from(set);
};


// => [1, 2, 3])
console.log([1, 2, 2, 3, 3, 3].uniq());

// Array#twoSum - returns an array of position pairs where the elements sum to zero
Array.prototype.twoSum = function(){
    let res = [];
    for (let i = 0 ; i < this.length ;i++) {
        for (let j = i+1; j < this.length; j++) {
            if(this[i]+this[j] === 0){
                res.push([i,j]);
            }
        }
    }
    return res;
}
console.log([1, 2, 3, 4, 3, -2, -1, -3, -4, 4, 2, 1, -1].twoSum());

// Array#transpose - where we have a two-dimensional array representing a matrix. returns the transpose
// should not mutate the original array

Array.prototype.transpose = function () {
    let res = [];
    for(let i=0; i<this.length; i++){ // row
        for(let j=0;j<this.length;j++){//col
            if (j>=res.length){
                res.push([]);
            }
            res[j].push(this[i][j]);
        }
    }
    return res;
};

console.log([[1, 2, 3], [7, 8, 9], [2, 4, 7]].transpose());
console.log([[1,2],[3,4],[5,6]].transpose());


