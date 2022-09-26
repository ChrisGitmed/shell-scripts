# This script receives the name of the script as its only argument,
# and outputs a Node.js script template in the current directory
#
# @param $1 - The name of the script

if [ -d './app/scripts' ]; then
  echo "Creating './app/scripts/$1.js'..."
  echo "import Yargs from 'yargs';
const { argv } = Yargs(process.argv.slice(2));

/**
 * {DESCRIPTION}
 *
 * Invoke the script like this:
 * node app/scripts/$1.js --run
 *
 * @param {*} run - The run flag
 */
const $1 = async (run) => {
  console.log(\`\${run ? 'REAL' : 'DRY'} RUN\\\n\`);

  try {
    // If dry run
    if (!run) {
      console.log('Use \'--run\' to {DO STUFF}.');
      return;
    }

    // Real run


    console.log('Fin\\\n');
  } catch (err) {
    console.error('An error occurred: ', err);
  }
};

(async () => {
  await $1(argv.run);
  process.exit(0);
})();
" > app/scripts/"$1.js"
  echo "Created."
else
  echo "'./app/scripts' directory not found.\nAborting script..."
fi