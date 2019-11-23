const signed = (number, len = 32) => {
  let maxPossible = 2 ** (len - 1) - 1;
  let minPossible = -(2 ** (len - 1));
  let binaryString = "";
  let currentValue = 0;

  // determine first bit
  if (number < 0) {
    binaryString += 1;
    currentValue = minPossible;
  } else {
    binaryString += 0;
  }

  // aim: make ( currentvalue -eq number )
  for (let j = len - 1; j > 0; j--) {
    let val = 2 ** (j - 1);
    if (currentValue + val <= number) {
      binaryString += "1";
      currentValue += val;
    } else {
      binaryString += "0";
    }
  }
  // number can't be bigger than maxPossible
  // number can't be smaller then minPossible
  return binaryString;
};

const unsigned = (number, len = 32) => {
  let max = 1;
  let i = 1; // i: length of the binary
  while (max < number) {
    i++;
    max = 2 ** i - 1;
  }

  let binaryString = "";
  let remaining = number;

  for (let j = i; j > 0; j--) {
    if (2 ** (j - 1) <= remaining) {
      binaryString = binaryString + "1";
      remaining = remaining - 2 ** (j - 1);
    } else {
      binaryString = binaryString + "0";
    }
  }
  const prefix = "0".repeat(len - i);
  return prefix + binaryString;
};

module.exports = { unsigned, signed };
