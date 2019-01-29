#!/bin/bash
flag=""
clear
printf "************ welcom in add contect ********* \n"
read -p "enter the name " name
while [[ ! "$name" =~ ^[a-zA-Z]+$ ]]; do
    read -p "enter the valid  name " name
done
clear
read -p "enter the email " email
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
while [[ ! $email =~ $regex  ]]; do
    read -p "enter the valid  email " email
done
clear
read -p "enter the mobile number " mobile
while [ -z $mobile ]; do 
    read -p "enter the name " mobile      
done
while [ -n $mobile ];do

    if [[ "$mobile" =~ ^01[5|1|2|0][0-9]{8} ]]
        then 
        if [[ $(cut -f 3 -d: contact.text|grep "$mobile") ]]
            then flag="exist"
        else
            break
        fi
    fi
    read -p "enter the coorect mobile and not exist" mobile  
done
clear
select choice in add "no-add" 
do
 case $choice in
    add ) 
        echo "$name:$email:$mobile" >> contact.text
        break
    ;;
    "no-add" ) 
        break
    ;;
    * )
        echo "Chose the cooreect plz "
    ;;
 esac
done
clear
select choice in "enter another one" "go home" 
do
 case $choice in
    "enter another one" ) 
        ./add.sh
        break
    ;;
    "go home" ) 
        ./main.sh
         break
    ;;
    * )
        echo "Chose the cooreect plz "
    ;;
 esac
done