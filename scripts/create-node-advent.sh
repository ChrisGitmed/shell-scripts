# Automates the setup of my Advent of Code 2022 directories.
# The first argument passed to the script is the directory name.
#
# Invoke the script like this:
# sh create-node-advent.sh dirName

dirPath=advent/$1
mkdir $dirPath &&
touch $dirPath/_.md $dirPath/_.test.js $dirPath/input.js $dirPath/solutions.js &&

echo "# Day: $1
## Part 1

## Part 2" > $dirPath/_.md &&

echo "const { test, expect } = require('@jest/globals');

const {  } = require('./solutions');
const { inputData } = require('./input');

test('Should ', () => {
  expect((inputData)).toBe();
});

test('Should ', () => {
  expect((inputData)).toBe();
});" > $dirPath/_.test.js

echo "const inputData = \`\`;

module.exports = { inputData }" > $dirPath/input.js

echo "
// Part 1


// Part 2


module.exports = {  };" > $dirPath/solutions.js
