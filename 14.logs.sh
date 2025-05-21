#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER = "/var/log/shellscript-logs"
SCRIPT_NAME= $(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $Logs_FOLDER
echo "Script started exectining at: $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R Error:: please run this script with root user"
    exit 1 #give other than 0 upto 127
else
    echo "you are running with root access" &>>$LOG_FILE
fi

# validate function takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $? -eq 0 ]
    then 
        echo -e "installing $2 is ... $G success $N" &>>$LOG_FILE
    else
        echo -e "installing $2 is ... $R Failure $N" &>>$LOG_FILE
        exit 1
    fi
}

dnf list install mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to install" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $1 "mysql"
else
    echo -e "nothing to do Mysql...$Y already installed it $N" &>>$LOG_FILE
fi

dnf list install python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed.. going to install" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo "Nothing to do python... $Y already installed $N" &>>$LOG_FILE
fi

dnf list install nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed.. going to install IT" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nothing to do nginx... $Y already installed $N" &>>$LOG_FILE
fi