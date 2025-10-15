#!/bin/sh -l

# Build command arguments
set --

# Add paths if provided
if [ -n "$PATHS" ]; then
    for path in $PATHS; do
        set -- "$@" "$path"
    done
fi

# Add exclude paths if provided
if [ -n "$EXCLUDE" ]; then
    for exclude_path in $EXCLUDE; do
        set -- "$@" "-e" "$exclude_path"
    done
fi

# Add max complexity if provided
[ -n "$MAX_COMPLEXITY" ] && set -- "$@" "-mx" "$MAX_COMPLEXITY"

# Add boolean flags if true
[ "$IGNORE_COMPLEXITY" = "true" ] && set -- "$@" "-i"
[ "$OUTPUT_CSV" = "true" ] && set -- "$@" "-c"
[ "$OUTPUT_JSON" = "true" ] && set -- "$@" "-j"
[ "$QUIET" = "true" ] && set -- "$@" "-q"

# Add details if provided
[ -n "$DETAILS" ] && set -- "$@" "-d" "$DETAILS"

# Add sort if provided
[ -n "$SORT" ] && set -- "$@" "-s" "$SORT"

# Execute complexipy
exec complexipy "$@"
