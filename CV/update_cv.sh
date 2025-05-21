#!/bin/bash

# Script to update CV in all necessary locations
echo "Updating CV in website directories..."

# Create directories if they don't exist
mkdir -p ../static/uploads
mkdir -p ../static/pdf

# Copy CV to all necessary locations
cp CV.pdf ../static/uploads/resume.pdf
cp CV.pdf ../static/uploads/CV.pdf
cp CV.pdf ../static/pdf/CV.pdf

echo "CV has been updated in all locations!"
