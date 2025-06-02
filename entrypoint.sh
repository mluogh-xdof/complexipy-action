#!/bin/sh -l

echo "Running complexipy with arguments: $@"

output_file=$( [ "$3" = "true" ] && '-o' || '' )
details=$( [ "$4" = "low" ] && '-d low' || '-d normal' )
quiet=$( [ "$5" = "true" ] && '-q' || '' )
sort=$( [ "$6" = "asc" ] && '-s asc' || [ "$6" = "desc" ] && '-s desc' || [ "$6" = "name" ] && '-s name' || '' )

complexipy $1 -c $2 $output_file $details $quiet $sort
