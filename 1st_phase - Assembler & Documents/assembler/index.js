const fs = require("fs"); // filesystem module
const itb = require("int-to-binary"); // we wrote that module

// our opcodes
const _opCodes = {
  ADD: "0000",
  ADDI: "0001",
  AND: "0010",
  ANDI: "0011",
  OR: "0100",
  ORI: "0101",
  XOR: "0110",
  XORI: "0111",
  LD: "1000",
  ST: "1001",
  JUMP: "1010",
  BEQ: "1011",
  BLT: "1100",
  BGT: "1101",
  BGE: "1110",
  BLE: "1111"
};

// register codes
const _registers = {
  R0: "0000",
  R1: "0001",
  R2: "0010",
  R3: "0011",
  R4: "0100",
  R5: "0101",
  R6: "0110",
  R7: "0111",
  R8: "1000",
  R9: "1001",
  R10: "1010",
  R11: "1011",
  R12: "1100",
  R13: "1101",
  R14: "1110",
  R15: "1111"
};
try {
  // delete out.hex file if available
  fs.unlinkSync("out.hex");
} catch {}

// parse and store every line as array element
const instructions = fs
  .readFileSync("instructions.txt")
  .toString()
  .split("\n");

if (process.argv[2] == "--logism") {
  fs.appendFileSync("out.hex", "v2.0 raw" + "\n");
}
instructions.forEach(i => {
  i = i.replace("\r", "");
  console.log(i.padEnd(18), get(i), toHex("00" + get(i)));
  fs.appendFileSync("out.hex", toHex("00" + get(i)) + "\n");
});

// console.log(get("ADD R1,R2,R3"));
// console.log(get("ADDI R5,R6,-4"));

// return 18 bits binary
function get(i) {
  let opcode = i.split(" ")[0];
  let params = i
    .slice(opcode.length + 1)
    .split(",")
    .map(x => x.trim());
  if (opcode == "ADD" || opcode == "AND" || opcode == "OR" || opcode == "XOR") {
    return (
      _opCodes[opcode] +
      _registers[params[0]] +
      _registers[params[1]] +
      _registers[params[2]] +
      "00"
    );
  } else if (
    opcode == "ADDI" ||
    opcode == "ANDI" ||
    opcode == "ORI" ||
    opcode == "XORI"
  ) {
    return (
      _opCodes[opcode] +
      _registers[params[0]] +
      _registers[params[1]] +
      itb.signed(params[2], 6)
    );
    // } else if (opcode == "AND") {
    // } else if (opcode == "ANDI") {
    // } else if (opcode == "OR") {
    // } else if (opcode == "ORI") {
    // } else if (opcode == "XOR") {
    // } else if (opcode == "XORI") {
  } else if (opcode == "LD" || opcode == "ST") {
    return _opCodes[opcode] + _registers[params[0]] + itb.signed(params[1], 10);
    // } else if (opcode == "ST") {
  } else if (opcode == "JUMP") {
    let j = _opCodes[opcode] + itb.signed(params[0], 14);
    return j;
  }
  // else if (opcode == "BEQ") {
  // } else if (opcode == "BLT") {
  // } else if (opcode == "BGT") {
  // } else if (opcode == "BGE") {
  // } else if (opcode == "BLE") {
  // }
  else {
    return (
      _opCodes[opcode] +
      _registers[params[0]] +
      _registers[params[1]] +
      itb.signed(params[2], 6)
    );
  }
}

function toHex(binary) {
  let hex = parseInt(binary, 2)
    .toString(16)
    .toUpperCase();
  return "0".repeat(5 - hex.length) + hex;
}

/*
ADD R0,R1,R2
0000 0000 0001 0010 XX
        =>
0000 0000 0000 0100 1000  => 00048
*/
