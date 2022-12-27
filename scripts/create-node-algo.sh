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
const { solution } = require('../solutions/$solutionfile');

test('Should ', () => {
  const input = 0;
  expect(solution(input)).toBe();
});

test('Should ', () => {
  const input = 0;
  expect(solution(input)).toBe();
});

test('Should ', () => {
  const input = 0;
  expect(solution(input)).toBe();
});
" > $testfile &&

echo "Fin!"
