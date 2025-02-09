#!/bin/bash
# Script: jbuild.sh
# ************************************************************************************
# The script jbuild.sh compiles all Java files (*.java) in the current directory and
# its subfolders. Steps to do that:
# 1. Use the 'find' command to search for all files with the .java extension in the
#    current directory and all of its subdirectories. The paths of these files are
#    listed in a file named sources.txt.
# 2. Use the 'javac' command to compile all the Java files listed in sources.txt. 
#    The @ symbol tells 'javac' to read file names from the sources.txt file.
# 3. Check if the 'javac' command executed successfully by examining its exit status.
#    If the exit status is 0, the compilation was successful; otherwise, it failed.
# 4. Print a message to the terminal indicating whether the compilation was successful or failed.
# 5. Clean up by removing the sources.txt file, as it is no longer needed after compilation.
# ------------------------------------------------------------------------------------
# Author:   Patrik Eigenmann
# eMail:    p.eigenmann@gmx.net
# GitHub:   www.github.com/PatrikEigenmann/bash
# ------------------------------------------------------------------------------------
# Change Log:
# Tue 2023-06-13 File created.                                          Version: 00.01
# ************************************************************************************

# Find all Java files in the current directory and its subdirectories
find . -name "*.java" > sources.txt

# Compile all found Java files
javac @sources.txt

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful."
else
    echo "Compilation failed."
    exit 1
fi

# Clean up the sources.txt file
rm sources.txt
