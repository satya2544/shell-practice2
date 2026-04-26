#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
LOGS_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(data)"

if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
       echo -e  "Installing $2 ... $R is failure $N"
       exit 1
    else
       echo -e "Installing $2 ... $G is SUCCESS $N"
     fi

 }

 dnf list installed mysql &>>$LOGS_FILE

 if [ $? -ne 0 ]; then
      dnf install mysql -y &>>$LOGS_FILE
      VALIDATE $? "MYSQL"   
 else
    echo -e "MySQL already exist ... $Y SKIPPING $N"
 fi           


 dnf list installed nginx &>>$LOGS_FILE

 if [ $? -ne 0 ]; then
      dnf install nginx -y &>>$LOGS_FILE
      VALIDATE $? "Nginx"   
 else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
 fi 

dnf list installed python3 &>>$LOGS_FILE

 if [ $? -ne 0 ]; then
      dnf install python3 -y &>>$LOGS_FILE
      VALIDATE $? "Python3"   
 else
    echo -e "Python already exist ... $Y SKIPPING $N"
 fi 




