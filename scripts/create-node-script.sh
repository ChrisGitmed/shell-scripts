# Generates a Node.js script file in either './app/scripts' or './scripts',
# if they exist. If they do not, no script file will be created.
#
# Params: 
#   $1: The desired name of the script
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

# Format template
TEMPLATE="import { argv } from 'dark-args';

/**
 * Invoke the script like this:
 * node $RELATIVE_PATH --run
 *
 * @param {*} run - The run flag
 */
const $1 = async (run) => {
  try {
    // If dry run
    if (!run) {
      // Code goes here
      return;
    }
    // Real run
    // Code goes here

    console.log('Fin!');
  } catch (err) {
    console.error('An error occurred: ', err);
  }
};

(async () => {
  await $1(argv.run);
  process.exit(0);
})();"

# Write file
echo "$TEMPLATE" > $RELATIVE_PATH
echo "Created $RELATIVE_PATH."
echo "Fin!"
