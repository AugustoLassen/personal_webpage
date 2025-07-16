#!/bin/bash

set -e

# Set current directory
cdir=${PWD}

# Define zip file and extract dir
zip_file="CV_Augusto.zip"
extract_dir="src"

# Clean up any previous extraction
rm -rf "$extract_dir"
mkdir -p "$extract_dir"
unzip -q "$zip_file" -d "$extract_dir"

cd "$extract_dir"

# Find main .tex file (fallback: first .tex file)
main_tex=$(find . -maxdepth 1 -name "CV.tex" -o -name "*.tex" | head -n 1)

if [ -z "$main_tex" ]; then
  echo "No .tex file found."
  exit 1
fi

# Compiling
pdflatex "$main_tex"
pdflatex "$main_tex"

# Move the compiled PDF back to parent dir
pdf_output="${main_tex%.tex}.pdf"

if [ -f "$pdf_output" ]; then
  mv "$pdf_output" "$cdir/"
  echo "PDF compiled and saved to: $cdir/$pdf_output"
else
  echo "Compilation failed. PDF not found."
  exit 1
fi

cd $cdir
rm -rf ./src
