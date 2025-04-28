#!/bin/bash
# =============================================================================
# run.sh - Script to compile and run Mean, Median, Mode programs
# Written for C (Procedural), OCaml (Functional), Python (OOP) implementations
# =============================================================================

set -e  # Exit if any command fails

echo "===================================="
echo "Running C Program (Procedural Approach)"
echo "===================================="

# Compile the C file
gcc -o math math.c

# Run the C program
./math


echo
echo "===================================="
echo "Running Python Program (OOP Approach)"
echo "===================================="

# Run Python script
# python3 math.py
python math.py

echo
echo "===================================="
echo "Running OCaml Program (Functional Approach)"
echo "===================================="

# Compile OCaml file
ocamlc -o math math.ml

# Run OCaml program
./math


echo
echo "===================================="
echo "All programs executed successfully!"
echo "===================================="
