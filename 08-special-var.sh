#!/bin/bash

echo "Hello from ramesh"
echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home directory of the user: $HOME"
echo "PID of the script: $$"
echo "PID of last command in background: $!"

