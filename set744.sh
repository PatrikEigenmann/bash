#!/bin/bash

# Check if a filename is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Get the filename from the first argument
FILENAME=$1

# Check if the file exists
if [ ! -f "$FILENAME" ]; then
  echo "Error: File '$FILENAME' not found"
  exit 1
fi

# Apply chmod 744 to the file
chmod 744 "$FILENAME"

# Confirm success
if [ $? -eq 0 ]; then
  echo "Permissions set to 744 for '$FILENAME'"
else
  echo "Failed to set permissions"
  exit 1
fi