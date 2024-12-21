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
# Author:		Patrik Eigenmann
# eMail:		p.eigenmann@gmx.net
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

script_version="00.13"
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
    echo "getting: bash template -> $filename.sh"
	cp /Users/patrik/Development/templates/bash.tpl $filename.sh
fi

# -----------------------------
# c-Program section
# -----------------------------
if [ $language = "-c" ]; then
    echo "getting: c_template -> $filename.c"
	cp /Users/patrik/Development/templates/c_template.c $filename.c
fi

# -----------------------------
# C\C++ Header section
# -----------------------------
if [ $language = "-h" ]; then
    echo "getting: header_template -> $filename.h"
	cp /Users/patrik/Development/templates/header_template.h $filename.h
fi

# -----------------------------
# Makefile section
# -----------------------------
if [ $language = "-mf" ]; then
    echo "getting: makefile_template -> $filename.makefile"
	cp /Users/patrik/Development/templates/makefile_template.makefile $filename.makefile
fi

# -----------------------------
# PHP section
# -----------------------------
if [ $language = "-php" ]; then
    echo "getting: php template -> $filename.php"
	cp /Users/patrik/Development/templates/php.tpl $filename.php
fi

# -----------------------------
# Python section
# -----------------------------
if [ $language = "-py" ]; then
    echo "getting: python template -> $filename.py"
	cp /Users/patrik/Development/templates/python.tpl $filename.py
fi

# -----------------------------
# Web-PHP section
# -----------------------------
if [ $language = "-wphp" ]; then
    echo "getting: webphp_template -> $filename.php"
	cp /Users/patrik/Development/templates/www-php_template.php $filename.php
fi

# -----------------------------
# Java Class section
# -----------------------------
if [ $language = "-j" ]; then
    echo "getting: java_template -> $filename.java"
	cp /Users/patrik/Development/templates/java_template.java $filename.java
fi

# -----------------------------
# Java starter program section
# -----------------------------
if [ $language = "-cj" ]; then
    echo "getting: c_java_template -> $filename.c"
	cp /Users/patrik/Development/templates/c_java_template.c $filename.c
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