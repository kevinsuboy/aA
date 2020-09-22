// range
function range(start, end) {
    if(start === end) return [];
    let res = range(start,end-1);
    res.push(end-1);
    return res;
}

console.log(`range(3, 10) = ${range(3, 10)}`);

// sumRec
function sumRec(numbers) {
    if (numbers.length === 1) return numbers[0];
    return numbers[numbers.length-1] + sumRec(numbers.slice(0,numbers.length-1));
}

console.log(`sumRec([1, 3, 5]) = ${sumRec([1, 3, 5])}`);

// sumIter
function sumIter(numbers) {
    let res = 0;
    for(let i=0;i<numbers.length;i++) res += numbers[i];
    return res;
}

console.log(`sumIter([1, 3, 5]) = ${sumIter([1, 3, 5])}`);

// exp1, exp2
function exp1(base, exponent) {
    if(exponent===0) return 1;
    return base * exp1(base,exponent-1);
}

console.log(`exp1(2, 4) = ${exp1(2, 4)}`);

function exp2(base, exponent) {
    if(exponent===0) return 1;
    if(exponent===1) return base;
    if(exponent%2 === 0)
        return base**2 * (exp2(base, (exponent - 2) / 2) ** 2);
    else
        return base * (exp2(base, (exponent - 1) / 2) ** 2);
}

console.log(`exp2(2, 4) =  ${exp2(2, 4)}`);
console.log(`exp2(2, 5) =  ${exp2(2, 5)}`);

// fibsRec, fibsIter
function fibsRec(n) {
    if (n === 0) return [];
    if (n === 1) return [1];
    if (n === 2) return [1,1];
    let res = fibsRec(n-1);
    res.push(res[res.length - 1] + res[res.length - 2]);
    return res;
}

console.log(`fibsRec(5) = ${fibsRec(5)}`);

function fibsIter(n) {
    if(n === 0) return [];
    if (n === 1) return [1];
    if (n === 2) return [1,1];
    let res = [1,1];
    while(res.length<n){
        res.push(res[res.length - 1] + res[res.length - 2]);
    }
    return res;
}

console.log(`fibsIter(5) = ${fibsIter(5)}`);

// deepDup

// This function is a type-checking helper function
// See this article for an explanation:
// https://toddmotto.com/understanding-javascript-types-and-reliable-type-checking/

function deepDup(arr) {
    if(!(arr instanceof Array)) // arr is not Array (primitive num)
        return arr;
    return arr.map(el => deepDup(el));
}

const array = [[2], 3];
const dupedArray = deepDup(array);
console.log(`deepDup original = ${JSON.stringify(array)}`);

dupedArray[0].push(4);

console.log(`deepDup original = ${JSON.stringify(array)} (should not be mutated)`);
console.log(`deepDup duped = ${JSON.stringify(dupedArray)} (should be mutated)`);

// bsearch
function bsearch(numbers, target) {
    let m = (numbers.length - 1) / 2;
    if(numbers(Math.floor(numbers[m])) === target) return m;

}

console.log(`bsearch([1, 2, 3], 3) = ${bsearch([1, 2, 3], 3)}`);
console.log(`bsearch([1, 2, 3], 2.5) = ${bsearch([1, 2, 3], 2.5)}`);

// merge, mergeSort
function merge(left, right) {
}

function mergeSort(array) {
}

console.log(`mergeSort([4, 5, 2, 3, 1]) = ${mergeSort([4, 5, 2, 3, 1])}`);

// // subsets
// function subsets(array) {
// }

// console.log(`subsets([1, 3, 5]) = ${JSON.stringify(subsets([1, 3, 5]))}`);
