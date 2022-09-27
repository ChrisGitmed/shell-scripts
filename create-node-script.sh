# This script receives the name of the script to be created as its only argument,
# and outputs a Node.js script template in either the 'app/scripts/' or 'scripts/'
# directories, if they exist. If they do not, no script will be created.
#
# @param $1 - The name of the script to be created

TEMPLATE="import Yargs from 'yargs';
const { argv } = Yargs(process.argv);

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
      console.log('Use \'--run\' to {DO STUFF}.\\\n');
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
})();"

if [ -d 'app/scripts' ]; then
  echo "Creating 'app/scripts/$1.js'..."
  echo "$TEMPLATE" > app/scripts/"$1.js"
  echo "Created."
elif [ -d 'scripts' ]; then
  echo "Creating 'scripts/$1.js..."
  echo "$TEMPLATE" > scripts/"$1.js"
  echo "Created."
else
  echo "Neither 'app/scripts' nor 'scripts' directories found.\nAborting script..."
fi
