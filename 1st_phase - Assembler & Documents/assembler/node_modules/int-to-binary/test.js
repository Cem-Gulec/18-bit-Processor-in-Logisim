const toBinary = require("./index");

console.log(toBinary.signed(-1, 4));
// 1111

console.log(toBinary.signed(-120));
// 11111111111111111111111110001000
// default length is 32 bits if not provided

console.log(toBinary.unsigned(32, 8));
// 00100000