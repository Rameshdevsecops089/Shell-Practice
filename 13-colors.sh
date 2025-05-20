#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R Error:: please run this script with root user"
    exit 1 #give other than 0 upto 127
else
    echo "you are running with root access"
fi

# validate function takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $? -eq 0 ]
    then 
        echo -e "installing $2 is ... $G success $N"
    else
        echo -e "installing $2 is ... $R Failure $N"
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
    echo -e "nothing to do Mysql...$Y already installed it $N"
fi

dnf list install python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed.. going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is not installed... going to install it"
fi

dnf list install nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed.. going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nothing to do nginx... $Y already installed $N"
fi