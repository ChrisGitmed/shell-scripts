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

# Assign variables
file_name=${1##*/}
script_name=$(echo "$file_name" | cut -f 1 -d '.')
script_path=$1
script_args=${@:2}
output_filename="${script_name}Results.txt"

# Run script and write to file
echo "Running $file_name...\n" >> $output_filename
(time node $script_path $script_args) 2>&1 | tee -a $output_filename
