# Automates the setup of my Advent of Code 2022 directories.
# The first argument passed to the script is the directory name.
#
# Invoke the script like this:
# sh create-node-advent.sh dirName

dirname="advent/$1"
docfile="$dirname/_.md"
testfile="$dirname/_.test.js"
inputfile="$dirname/input.ts"
solutionfile="$dirname/solutions.ts"

mkdir $dirname &&
touch $docfile $testfile $inputfile $solutionfile &&

echo "# Day $1
## Part 1

## Part 2" > $docfile &&

echo "const { test, expect } = require('@jest/globals');

const {  } = require('./solutions');
const { inputData } = require('./input');

test('Should ', () => {
  expect((inputData)).toBe();
});

test('Should ', () => {
  expect((inputData)).toBe();
});" > $testfile

echo "export const inputData = \`\`;" > $inputfile

echo "
// Part 1
export const solutionOne = (input:string) => {

};

// Part 2
export const solutionTwo = (input:string) => {

};" > $solutionfile
