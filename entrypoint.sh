#!/bin/sh -l

echo "Running complexipy with arguments: $@"

# Use the virtual environment's Python to run complexipy
/venv/bin/complexipy "$@"
