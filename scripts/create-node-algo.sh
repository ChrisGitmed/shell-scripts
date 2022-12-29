# Automates the setup of my basic algorithm files.
# From the directory this script is invoked, creates a solution
# file in solutions/ and a corresponding test file in tests/.
# The first argument will be the name of the generated files, 
# and is required.
#
# Invoke the script like this:
# sh create-node-algo.sh fileName

# Validate required args
if [ -z $1 ]
then
  echo "Name is required.\nExiting."
  exit 0
fi

solutionfile=solutions/$1.js
testfile=tests/$1.test.js

# Create files
touch $solutionfile $testfile &&

# Write files
echo "/**
 *
 */
const solution = (input) => {

}

module.exports = { solution };" > $solutionfile &&

echo "const { test, expect} = require('@jest/globals');
const { solution } = require('../$solutionfile');

test('Should ', () => {
  const input = _;
  const result = _;
  expect(solution(input)).toBe(result);
});

test('Should ', () => {
  const input = _;
  const result = _;
  expect(solution(input)).toBe(result);
});

test('Should ', () => {
  const input = _;
  const result = _;
  expect(solution(input)).toBe(result);
});" > $testfile &&

echo "Fin!"
