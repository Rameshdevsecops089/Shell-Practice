#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: please run this script with root user"
    exit 1 #give other than 0 upto 127
else
    echo "you are running with root user"
fi

dnf list install mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "install mysql is ... success"
    else
        echo "install mysql is ... Failure"
        exit 1
    fi
else
    echo "mysql is already installed ... nothing to do"
if



