#!/bin/bash

# Start building the classpath
CLASSPATH="."
CLASSPATH="$CLASSPATH:/Users/patrik/Development/Java/extLib/javax.activation_1.2.2.v20221203-1659.jar"
CLASSPATH="$CLASSPATH:/Users/patrik/Development/Java/extLib/javax.mail.jar"
CLASSPATH="$CLASSPATH:/Users/patrik/Development/Java/extLib/sqlite-jdbc-3.49.1.0.jar"

# Define the program's main class
MAIN_CLASS="jBidder"

# Start the program
java -cp "$CLASSPATH" $MAIN_CLASS
