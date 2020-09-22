Array.prototype.myEach = function (callback) {
    for(let i=0;i<this.length;i++){
        callback(this[i]);
    }
}
// let arr = [1,2,3,4];
// console.log(typeof(arr));
// arr.myEach((el) => {
//     console.log(2*el);
// });

Array.prototype.myMap = function(cb){
    let new_arr = [];
    this.myEach((num)=>{
        new_arr.push(cb(num));
    });
    return new_arr;
}
// let arr = [4,6,3,1,8,1];
// console.log(
//     arr.myMap(
//     (num)=>{
//         if(num%2 == 0) return num;
//         else return false;
//     })
// );

Array.prototype.myReduce = function (cb,iV){
    let arr = this;
    if(!iV) iV = arr.shift();
    arr.myEach(
        el => iV = cb(iV,el) // cb(acc, el)
    );
    return iV;
}
let arr = [1,2,3];
// without initialValue
console.log(
arr.myReduce(function (acc, el) {
    return acc + el;
}) // => 6
);
arr = [1,2,3]
// with initialValue
console.log(
arr.myReduce(function (acc, el) {
    return acc + el;
}, 25) // => 31
);