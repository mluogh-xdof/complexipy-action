#!/bin/sh -l

# Use the virtual environment's Python to run complexipy
/venv/bin/complexipy $1 -c $2 -o $3 -d $4 -q $5 -s $6
