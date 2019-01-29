#!/bin/bash
clear

printf "************ welcom in update********* \n"
read -p "enter the phone number : " phone
color='\033[0;31m'
cd="\033[0m"

while [ -z $phone ]; do 
    read -p "enter the phone " phone      
done

while [ -n $phone ];do

    if [[ "$phone" =~ ^01[5|1|2|0][0-9]{8} ]]
        then 
        if [[ $(cut -f 3 -d: contact.text|grep "$phone") ]]
            then

            break  
        fi
    fi
    read -p "enter the coorect mobile and exist or write ${color}home ${cd}to go home : " phone
    if [ $phone = "home" ]
        then
            ./main.sh
            break
    fi  
done

 name=$(awk -F: -v a="$phone" '{if ($3==a) print $1;}' contact.text)
 email=$(awk -F: -v a="$phone" '{if ($3==a) print $2;}' contact.text)
printf " old name is ${color} $name  ${cd}| old Email is  ${color} $email ${cd}|old mobile ${color} $phone ${cd} \n"
read -p "enter the new name " name
while [[ ! "$name" =~ ^[a-zA-Z]+$ ]]; do
    read -p "enter the valid  name  : " name
done
clear
printf " old Email is  ${color} $email ${cd} \n"
read -p "enter the new email " email
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
while [[ ! $email =~ $regex  ]]; do
    read -p "enter the valid  email " email
done
clear
printf " old mobile ${color} $phone ${cd} \n"
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
awk -F: -v a="$phone" -v e="$email" -v n="$name" -v m="$mobile" 'BEGIN {flag=0;OFS=":" ; } {if ($3 == a){
                flag = 1;
                $2=e;
                $1=n;
                $3=m;
                }
                print $0;
                
            }END{}' contact.text >> contact2.text
mv contact2.text contact.text
echo "update Sucess"
sleep 1s

./main.sh