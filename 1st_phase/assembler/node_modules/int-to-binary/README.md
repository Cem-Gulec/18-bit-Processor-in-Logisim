# int-to-binary

*Integer to signed/unsigned binary converter.*
## Install

**npm**:  
`npm i int-to-binary`

or **yarn**:  
`yarn add int-to-binary`

## Usage

Include the module

```javascript
const itb = require("int-to-binary");

//convet number to signed (length) bits binary
itb.signed(number, length);

//convet number to unsigned (length) bits binary
itb.unsigned(number, length);
```

## Examples

### Integer to unsigned binary:

```javascript
const itb = require("int-to-binary");

console.log(itb.unsigned(7, 4));
// 0111

console.log(itb.unsigned(7, 5));
// 00111

console.log(itb.unsigned(32, 6));
// 100000

console.log(itb.unsigned(1));
// 00000000000000000000000000000001
// default length is 32 bits if not provided
```     


### Integer to signed binary:
```javascript
const itb = require("int-to-binary");

console.log(itb.signed(-1, 4));
// 1111

console.log(itb.signed(-1, 5));
// 11111

console.log(itb.signed(32, 6));
// 011111

console.log(itb.signed(-1));
// 11111111111111111111111111111111
// default length is 32 bits if not provided
```