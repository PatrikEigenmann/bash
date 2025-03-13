#!/bin/bash

# Define the destination folder
DESTINATION="/Users/patrik/Development/bash"

# Check if a filename is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Get the filename from the first argument
FILENAME=$1

# Check if the file exists in the current directory
if [ ! -f "$FILENAME" ]; then
  echo "Error: File '$FILENAME' not found in the current directory"
  exit 1
fi

# Copy the file to the destination folder
cp "$FILENAME" "$DESTINATION"

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "File '$FILENAME' successfully copied to $DESTINATION"
else
  echo "Error: Failed to copy file"
  exit 1
fi