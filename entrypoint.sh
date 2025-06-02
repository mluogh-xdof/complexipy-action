#!/bin/sh -l

echo "Running complexipy with arguments: $@"

files=$(echo "$1" | tr '\n' ' ')

echo "Files: $files"

current_dir=$(pwd)
echo "Current directory: $current_dir"

ls -la "$current_dir"

output_file=""
if [ "$3" = "true" ]; then
    output_file="-o"
fi

details="-d normal"
if [ "$4" = "low" ]; then
    details="-d low"
fi

quiet=""
if [ "$5" = "true" ]; then
    quiet="-q"
fi

sort=""
if [ "$6" = "asc" ]; then
    sort="-s asc"
elif [ "$6" = "desc" ]; then
    sort="-s desc"
elif [ "$6" = "name" ]; then
    sort="-s name"
fi

complexipy "$files" -c "$2" $output_file $details $quiet $sort
