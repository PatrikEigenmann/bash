#!/bin/bash
# ************************************************************************************
# cdget.sh - This script will create a copy of the desired template in the active
# folder. Following options/templates are available (subject to more templates, depends
# on the programming needs):
# cdget.sh <option: -b>		<filename>                  {for bash files}
# cdget.sh <option: -c>		<filename>                  {for c files}
# cdget.sh <option: -h>		<filename>		            {for c\c++ header files}
# cdget.sh <option: -mf>    <filename>                  {makefile for the tool pmake}
# cdget.sh <option: -py>	<filename>		            {for python files}
# cdget.sh <option: -php>	<filename>		            {for php files}
# cdget.sh <option: -wphp>	<filename>		            {for web php files}
# cdget.sh <option: -j>		<filename>		            {for java class files}
# cdget.sh <option: -cj>	<filename>		            {for c starter for java programm}
# cdget.sh <option: -?>     {call the help}
# ------------------------------------------------------------------------------------
# Author:   Patrik Eigenmann
# eMail:    p.eigenmann@gmx.net
# GitHub:   www.github.com/PatrikEigenmann/bash
# ------------------------------------------------------------------------------------
# Change Log:
# Tue 2023-06-13 File created.                                          Version: 00.01
# Tue 2023-06-13 "-?" or --help call the help manpages style.	        Version: 00.02
# Tue 2023-06-13 -b	    bash files implemented.		                    Version: 00.03
# Tue 2023-06-13 -c	    c files implemented.		                    Version: 00.04
# Tue 2023-06-13 -h	    c\c++ header files implemented.	                Version: 00.05
# Wed 2023-06-14 -php	php files implemented.		                    Version: 00.06
# Wed 2023-06-14 -py	python files implemented.	                    Version: 00.07
# Wed 2023-06-14 -wphp	web php files implemented.	                    Version: 00.08
# Mon 2024-12-16 -j     java files implemented.                         Version: 00.09
# Mon 2024-12-16 -cj	c files as starter for java apps.		        Version: 00.10
# Mon 2024-12-16 -mf	makefile template implemented.		            Version: 00.11
# Mon 2024-12-16 Changed the path to user patrik, and added output.     Version: 00.12
# Mon 2024-12-16 Corrected a bug: -mk was wrong it's -mf.               Version: 00.13
# Mon 2024-12-16 Corrected the call of the help file.                   Version: 00.14
# Sat 2024-12-21 Corrected all the templates and cleaned up.            Version: 00.15
# Sun 2024-12-22 web php integrated again.                              Version: 00.16
# Sun 2025-03-17 Added -clsp classpath template for java.               Version: 00.17
# Sun 2025-03-17 Added -bj as a bash java starter .                     Version: 00.18
# Sun 2025-03-17 Added placeholder replacement functionality.           Version: 00.19
# Tue 2025-03-18 Added -jm as a jmake makefile.                         Version: 00.20
# Wed 2025-03-19 Added -cfg as a config.xml template.                   Version: 00.21
# ************************************************************************************

# ---------------------------------------------------------------------
# display_help - displayes a helpful description alla man pages style.
# A brief description of all the parameters and how to use the script.
# ---------------------------------------------------------------------
display_help () {
    echo "NAME:"
    echo "      cdget.sh - Version: $script_version"
    echo " "
    echo "SYNOPSIS:"
    echo "      cdget.sh <option: -py,php,wphp,c,cpp,h,j,?> <path> <filename>"
    echo " "
    echo "DESCRIPTION:"
    echo "      The script will make a copy of a specified template to make coder's"
    echo "      life very easy. All parameters explained as follows!"
    echo " "
    echo "      -b"
    echo "          Option -b to get a bash script template in the working folder."
    echo " "
    echo "      -c"
    echo "          Option -c to get a c program template in the working folder."
    echo " "
    echo "      -h"
    echo "          Option -h to get a c/c++ header template in the working folder."
    echo " "
    echo "      -mf"
    echo "          Option -mf to get a makefile to use with my tool pmake in the"
    echo "          working folder."
    echo " "
    echo "      -php"
    echo "          Option -php to get a PHP template in the working folder."
    echo " "
    echo "      -py"
    echo "          Option -py to get a python template in the working folder."
    echo " "
    echo "      -wphp"
    echo "          Option -wphp to get a Website PHP template in the working folder."
    echo " "
    echo "      -j"
    echo "          Option -j to get a java class template in the working folder."
    echo " "
    echo "      -cj"
    echo "          Option -cj to get a c program template as a starter for a java"
    echo "          app in the working folder."
    echo " "
    echo "      -bj"
    echo "          Option -bj to get a bash script template as a starter for a java"
    echo "          app in the working folder."
    echo " "
    echo "      -clsp"
    echo "          Option -clsp to get a classpath template as a library list for a"
    echo "          Java app in the working folder."
    echo " "
    echo "      -jm"
    echo "          Option -jm to get a java makefile jmake for a"
    echo "          Java app in the working folder."
    echo " "
    echo "      -cfg"
    echo "          Option -cfg to get a config.xml for a Java or C# app"
    echo "          in the working folder."
    echo " "
    echo "      \"-?\" or --help"
    echo "          Option -? displays this help file. With calling the help file,"
    echo "          no other parameter are required!"
    echo " "
    echo "      <path>"
    echo "          The secod parameter defines the path. It can be either ./ or a name."
    echo " "
    echo "      <filename>"
    echo "          The third parameter defines the filename with a given name."
    echo " "
    echo "AUTHOR:"
    echo "      Written by Patrik Eigenmann. My email is p.eigenmann@gmx.net."
    echo " "
    echo "COPYRIGHT:"
    echo "      Copyright © 2023 Free Software Foundation, Inc. This software is under the GPLv3+ license."
    echo "      GNU GPL version 3 or later https://gnu.org/licenses/gpl.html."
    echo "      This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent"
    echo "      permitted by law."
}

# ---------------------------------------------------------------------
# replace_placeholders - replaces placeholders in a template file with
# actual values and writes the result to an output file.
# @param template_file The path to the template file.
# @param project_name The name of the project or filename to replace in the template.
# @param extension The file extension for the output file.
#
# The placeholders are:
# {project_name}    - will be replaced with the project name.
# {file_name}       - will be replaced with the file name.
# DAY YYYY-MM-DD    - will be replaced with the current date in the
#                     format (Three letter day) YYYY-MM-DD.
# ---------------------------------------------------------------------
replace_placeholders() {
    local template_file="$1"
    local project_name="$2"
    local extension="$3"
    local file_name="$2.$extension"
    local current_date
    current_date=$(date "+%a %Y-%m-%d") # Get the current date in the desired format: (Three letter day) YYYY-MM-DD



    # Perform the replacements
    sed -e "s/{project_name}/$project_name/g" \
        -e "s/{file_name}/$file_name/g" \
        -e "s/DAY YYYY-MM-DD/$current_date/g" "$template_file" > "$file_name"
}

script_version="00.21"
x=1
language=""
filename=""

# -----------------------------
# Parameter loop
# -----------------------------
for p in $@
do
	if [ $x -eq 1 ]; then
		language="$p"
	fi

	if [ $x -eq 2 ]; then
		filename=$p
	fi

	x=$(( x + 1 ))
done

# -----------------------------
# bash files sections
# -----------------------------
if [ $language = "-b" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -c option."
        exit 1
    fi

	replace_placeholders "/Users/patrik/Development/templates/bash.tpl" "$filename" "sh"
    echo "$filename.sh was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# c-Program section
# -----------------------------
if [ "$language" = "-c" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -c option."
        exit 1
    fi

    replace_placeholders "/Users/patrik/Development/templates/c.tpl" "$filename" "c"
    echo "$filename.c was created with placeholders replaced in the acive folder."
fi


# -----------------------------
# C\C++ Header section
# -----------------------------
if [ $language = "-h" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -h option."
        exit 1
    fi

	replace_placeholders "/Users/patrik/Development/templates/h.tpl" "$filename" "h"
    echo "$filename.h was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Makefile section
# -----------------------------
if [ $language = "-mf" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -h option."
        exit 1
    fi
	replace_placeholders "/Users/patrik/Development/templates/makefile.tpl" "$filename" "makefile"
    echo "$filename.makefile was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# PHP section
# -----------------------------
if [ $language = "-php" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -php option."
        exit 1
    fi
    
	replace_placeholders "/Users/patrik/Development/templates/php.tpl" "$filename" "php"
    echo "$filename.php was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Web-PHP section
# -----------------------------
if [ $language = "-wphp" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -php option."
        exit 1
    fi

	replace_placeholders "/Users/patrik/Development/templates/www-php.tpl" "$filename" "php"
    echo "$filename.php was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Python section
# -----------------------------
if [ $language = "-py" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -py option."
        exit 1
    fi
    
	replace_placeholders "/Users/patrik/Development/templates/python.tpl" "$filename" "py"
    echo "$filename.py was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Java starter program section
# -----------------------------
if [ $language = "-cj" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -cj option."
        exit 1
    fi

	replace_placeholders "/Users/patrik/Development/templates/c_java.tpl" "$filename" "c"
    echo "$filename.c was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Java starter script section
# -----------------------------
if [ $language = "-bj" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -bj option."
        exit 1
    fi

	replace_placeholders "/Users/patrik/Development/templates/sh_java.tpl" "$filename" "sh"
    echo "$filename.sh was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Java Class section
# -----------------------------
if [ $language = "-j" ]; then
    if [ -z "$filename" ]; then
        echo "Error: File name is required for -j option."
        exit 1
    fi

	replace_placeholders "/Users/patrik/Development/templates/java.tpl" "$filename" "java"
    echo "$filename.java was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Classpath section
# -----------------------------
if [ $language = "-clsp" ]; then

    replace_placeholders "/Users/patrik/Development/templates/classpath.tpl" "classpath" "txt"
    echo "classpath.txt was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# jmake section
# -----------------------------
if [ $language = "-jm" ]; then

    replace_placeholders "/Users/patrik/Development/templates/jmake.tpl" "$filename" "jmake"
    echo "$filename.jmake was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# config.xml section
# -----------------------------
if [ $language = "-cfg" ]; then

    replace_placeholders "/Users/patrik/Development/templates/config.tpl" "config" "xml"
    echo "config.xml was created with placeholders replaced in the acive folder."
fi

# -----------------------------
# Help section
# -----------------------------
if [ $language = "-?" ]|| [ "$language" = "--help" ]; then
	display_help
fi

# ----------------------- Depricated for now -------------------------

# -----------------------------
# c#-Program section
# -----------------------------
#if [ $language = "-c#" ]; then
#	cp ~/development/templates/c#_template.cs $filename.cs
#fi

# -----------------------------
# c++ Program section
# -----------------------------
#if [ $language = "-cpp" ]; then
#	cp ~/development/templates/cpp_template.cpp $filename.cpp
#fi