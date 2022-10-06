# Creates a basic Node.js script file in './app/scripts/', if
# the directory exists. If not, it creates the file in
# './scripts/'. If that directory does not exist either, no file
# will be created. The desired script name is the only parameter.
#
# Invoke the script like this:
# sh create-node-script.sh scriptName

# Ensure a script name has been provided
if [ -z $1 ]
then
  echo "Script name is required.\nExiting."
  exit 0
fi

# Ensure either 'app/scripts' or 'scripts' directories exist
if [ -d 'app/scripts' ]
then
  RELATIVE_PATH="app/scripts/$1.js"
elif [ -d 'scripts' ]
then
  RELATIVE_PATH="scripts/$1.js"
else
  echo "Neither 'app/scripts' nor 'scripts' directories found.\nExiting."
  exit 0
fi

# Create script skeleton from template
TEMPLATE="import { argv } from 'dark-args';
import { Shade } from 'js-shade';

/**
 * Invoke the script like this:
 * node app/scripts/$1.js --run
 *
 * @param {*} run - The run flag
 */
const $1 = async (run) => {
  try {
    // If dry run
    if (!run) {
      console.log(Shade.yellow('DRY Run'));
      console.log(\`Use \${Shade.green('--run')} to...\`);
      return;
    }
    // Real run
    console.log(Shade.yellow('REAL Run'));

    console.log('Fin!');
  } catch (err) {
    console.error('An error occurred: ', err);
  }
};

(async () => {
  await $1(argv.run);
  process.exit(0);
})();"

echo "$TEMPLATE" > $RELATIVE_PATH
echo "Created $RELATIVE_PATH."
