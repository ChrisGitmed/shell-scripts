# Splits a large CSV into smaller CSVs, preserving headers.
# Outputs the collection of smaller CSVs into a directory residing
# within the directory you call this script from.
#
# Params: 
#   $1: The full path to the CSV to split
#   $2: The maximum row size of the smaller CSVs

filepath=$1
header=$(head -1 $filepath)
split -l $2 $filepath xyz
n=1
mkdir split

for file in xyz*
do
  if [ $n -gt 1 ]; then 
    echo $header > split/part-${n}.csv
  fi
  cat $file >> split/part-${n}.csv
  rm $file
  ((n++))
done
