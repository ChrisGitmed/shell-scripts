# Automates the setup of my Advent of Code 22 directories
# The first argument passed to the script will be the name of the directory
#
# Invoke the script like this:
# sh create-node-advent.sh dirName

mkdir advent/$1 &&
touch advent/$1/_.md advent/$1/_.test.js advent/$1/input.js advent/$1/solutions.js &&

echo "# Day $1

## Part 1

## Part 2" > advent/$1/_.md &&

echo "const { test, expect } = require('@jest/globals');

const {  } = require('./solutions');
const inputData = require('./input');

test('', () => {
  expect((inputData)).toBe();
});

test('', () => {
  expect((inputData)).toBe();
});" > advent/$1/_.test.js

echo "module.exports = \`\`;" > advent/$1/input.js

echo "
// Part 1


// Part 2


module.exports = {  };" > advent/$1/solutions.js