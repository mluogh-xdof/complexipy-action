#!/bin/sh -l

if [ $# -eq 0 ]; then
    exec complexipy
fi

files=$(echo $1 | tr '\n' ' ')

ignore_complexity=""
if [ "$2" = "true" ]; then
    ignore_complexity="-i"
fi

output_csv=""
if [ "$3" = "true" ]; then
    output_csv="-c"
fi

output_json=""
if [ "$4" = "true" ]; then
    output_json="-j"
fi

details="-d normal"
if [ "$5" = "low" ]; then
    details="-d low"
fi

quiet=""
if [ "$6" = "true" ]; then
    quiet="-q"
fi

sort=""
if [ "$7" = "asc" ]; then
    sort="-s asc"
elif [ "$7" = "desc" ]; then
    sort="-s desc"
elif [ "$7" = "name" ]; then
    sort="-s name"
fi

complexipy $files $ignore_complexity $output_csv $output_json $details $quiet $sort
