#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "user running this script: $user"
echo "Home directory of user: $Home"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"
