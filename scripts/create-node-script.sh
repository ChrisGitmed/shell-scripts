# Creates a basic Node.js script file in './app/scripts/', if
# the directory exists, if it does not, it creates the file in
# './scripts/', if that directory does not exist either, no file
# will be created. The desired script name is the only parameter.
#
# @param $1 - The name of the script to be created

# Ensure a script name has been provided
if [ -z $1 ]
then
  echo "Script name is required.\nExiting."
  exit 0
fi

# Create script skeleton from template
template="import { argv } from 'dark-args';
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

# Check if the directory app/scripts exists, if yes write file
if [ -d 'app/scripts' ]
then
  echo "$template" > app/scripts/"$1.js"
  echo "Created 'app/scripts/$1.js'."
elif [ -d 'scripts' ]
then
  echo "$template" > scripts/"$1.js"
  echo "Created 'scripts/$1.js'."
else
  echo "Neither 'app/scripts' nor 'scripts' directories found.\nExiting."
fi
