#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: please run this script with root user"
    exit 1 #give other than 0 upto 127
else
    echo "you are running with root user"
fi

# validate function takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $? -eq 0 ]
    then 
        echo "install $2 is ... success"
    else
        echo "install $2 is ... Failure"
        exit 1
    fi
}

dnf list install mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to install"
    dnf install mysql -y
    VALIDATE $1 "mysql"
else
    echo "mysql is already installed ... nothing to do"
if

dnf list install python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed.. going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is already installed ... nothing to do"
if

dnf list install nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed.. going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed ... nothing to do"
if