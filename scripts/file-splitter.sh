# Splits a large CSV into (potentially) many smaller CSVs, preserving
# headers. The size of each chunked CSV is determined by the
# second parameter. Outputs the resulting CSVs to a
# subdirectory `split/` residing in the directory where this
# script is invoked.
#
# Params: 
#   $1: The full path to the CSV to split
#   $2: The maximum row size of the smaller CSVs
#
# Invoke the script like this:
# sh .../file-splitter.sh ~/path-to-file/extremely-large.csv 20000

filepath=$1
header=$(head -1 $filepath)
split -l $2 $filepath files
n=1
mkdir split

for file in files*
do
  if [ $n -gt 1 ]; then 
    echo $header > split/part-${n}.csv
  fi
  cat $file >> split/part-${n}.csv
  rm $file
  ((n++))
done
