# Runs a Node.js script, and writes logs from the script run, the total run-time,
# as well as the peak memory pressure to a .txt file.
# 
# Invoke the script like this
# sh node-runner.sh path-to-script/script.js scriptArgs

# Validate at least one param has been passed
if [[ ! -n $1 ]];
then 
  echo "No parameter passed."
  exit 0
fi

# Get the script name
# IFS='/'
# read -ra new_arr <<< $1
# echo "arr $new_arr"

# echo "name ${new_arr[-1]}"

# Assign path and arguments
script_path=$1
script_args=${@:2}

# Run script and write to file
node $script_path $script_args | tee test.txt
