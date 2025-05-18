#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "Error:: please run this script with root user"
else
    echo "you are running with root user"
fi

dnf install mysql -y