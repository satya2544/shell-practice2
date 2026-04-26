#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


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

 dnf list installed mysql

 if [ $? -ne 0 ]; then
      dnf install mysql -y
      VALIDATE $? "MYSQL"   
 else
    echo "MySQL already exist ... $Y SKIPPING $N"
 fi           


 dnf list installed nginx

 if [ $? -ne 0 ]; then
      dnf install nginx -y
      VALIDATE $? "Nginx"   
 else
    echo "Nginx already exist ... $Y SKIPPING $N"
 fi 

dnf list installed python3

 if [ $? -ne 0 ]; then
      dnf install python3 -y
      VALIDATE $? "Python3"   
 else
    echo "Python already exist ... $Y SKIPPING $N"
 fi 

