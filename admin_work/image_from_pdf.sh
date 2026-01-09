#!/bin/bash

# Check if pdfimages is installed
if ! command -v /usr/bin/pdfimages &> /dev/null; then
    echo "Error: pdfimages is not installed. Install it using your package manager (e.g., sudo apt install poppler-utils)."
    exit 1
fi

# Check for correct usage
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input.pdf output_prefix"
    exit 1
fi

PDF_FILE="$1"
OUTPUT_PREFIX="$2"

# Check if PDF file exists
if [ ! -f "$PDF_FILE" ]; then
    echo "Error: File '$PDF_FILE' not found."
    exit 1
fi

# Extract images using pdfimages
echo "Extracting images from $PDF_FILE..."
pdfimages -all "$PDF_FILE" "$OUTPUT_PREFIX"

if [ $? -eq 0 ]; then
    echo "Images extracted successfully. Files saved with prefix '$OUTPUT_PREFIX'."
else
    echo "Image extraction failed."
    exit 1
fi
