#!/bin/sh -l

files=$(echo $1 | tr '\n' ' ')

ignore_complexity=""
if [ "$2" = "true" ]; then
    ignore_complexity="-i"
fi

output_csv=""
if [ "$2" = "true" ]; then
    output_csv="-c"
fi

output_json=""
if [ "$3" = "true" ]; then
    output_json="-j"
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

complexipy $files $ignore_complexity $output_csv $output_json $details $quiet $sort
